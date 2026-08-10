# --------------------------------------------------------------
# Preliminary Makefile
# 
# Note, there are intermittent failures with using the bio tool.
# We need to check using something like echo 
# $CONDA_PREFIX | grep "/bio$"
# --------------------------------------------------------------
#
# This is an alternate/draft version of Makefile, extending it to cover
# more of the files in ./data. See biostar/biostar.qmd for the narrative
# notes this is based on.
# --------------------------------------------------------------

output_dir := ./data
hacking_dir := ./hacking

UCSC_BIGZIPS := https://hgdownload.gi.ucsc.edu/goldenPath/hg38/bigZips
NCBI_ASSEMBLY_REPORTS := https://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS

.PHONY: all

all: $(output_dir)/GABRA2.fa \
     $(output_dir)/hg38.fa \
     $(output_dir)/human_gene_counts.txt \
     $(output_dir)/assembly_summary_refseq.txt \
     $(output_dir)/NC_000004.12.txt \
     $(output_dir)/hg38_parsed.tsv \
     $(output_dir)/GABRA2_parsed.tsv

# --------------------------------------------------------------
# GABRA2 gene, via the `bio` command line tool.
# See biostar/biostar.qmd, "NCBI Main Index" section.
# --------------------------------------------------------------

$(output_dir)/GABRA2.fa: $(output_dir)/chr4.gb
	bio fasta $(output_dir)/chr4.gb --gene GABRA2 > $@

$(output_dir)/chr4.gb:
	@echo Making $@
	@mkdir -p $(output_dir)
	bio fetch NC_000004.12 > $@

# --------------------------------------------------------------
# UCSC hg38 downloads.
# See biostar/biostar.qmd, "Download info" section.
# --------------------------------------------------------------

$(output_dir)/hg38.fa:
	@echo Making $@
	@mkdir -p $(output_dir)
	wget -O $@.gz $(UCSC_BIGZIPS)/hg38.fa.gz
	gunzip $@.gz

$(output_dir)/hg38.ncbiRefSeq.gtf:
	@echo Making $@
	@mkdir -p $(output_dir)
	wget -O $@.gz $(UCSC_BIGZIPS)/genes/hg38.ncbiRefSeq.gtf.gz
	gunzip $@.gz

$(output_dir)/human_gene_counts.txt: $(output_dir)/hg38.ncbiRefSeq.gtf
	cat $< | cut -f 1 | sort | uniq -c | sort -rn | head -n 24 > $@

# --------------------------------------------------------------
# NCBI main index.
# See biostar/biostar.qmd, "NCBI Main Index" section.
# --------------------------------------------------------------

$(output_dir)/assembly_summary_refseq.txt:
	@echo Making $@
	@mkdir -p $(output_dir)
	wget -O $@ $(NCBI_ASSEMBLY_REPORTS)/assembly_summary_refseq.txt

# --------------------------------------------------------------
# GABRA2 region sequence, via Biopython/Entrez.
#
# This is NOT mentioned in biostar/biostar.qmd, but hacking/ has two
# candidate scripts for it:
#
#   - hacking/FetchGabraA2_HG38.py writes only the raw sequence
#     (print(record.seq)), no header. Its leftover output file,
#     hacking/NC_000004.12.txt, is a single very long line - it does
#     NOT match the file actually checked in under data/.
#
#   - hacking/FetchEntrez.py is a more general, argparse + BIO_DATA
#     driven script that writes the full SeqRecord repr
#     (print(record)). Its output format - ID/Name/Description/
#     "Number of features"/truncated Seq(...) - is an exact match for
#     data/NC_000004.12.txt (5 lines). This is almost certainly the
#     script actually used, so that's what this rule calls.
#
# Note hacking/FetchEntrez.py currently hardcodes the GABRA2 region's
# seq_start/seq_stop regardless of the gene_id/accession passed in, so
# it only really works correctly for NC_000004.12 today. No changes
# were made to it here since it already reproduces the checked-in file
# as-is; that hardcoding is left as a known wart for the future.
# --------------------------------------------------------------

$(output_dir)/NC_000004.12.txt: $(hacking_dir)/FetchEntrez.py
	@mkdir -p $(output_dir)
	BIO_DATA=$(output_dir) python3 $(hacking_dir)/FetchEntrez.py NC_000004.12

# --------------------------------------------------------------
# Parsed/derived GTF data (polars), plus the GABRA2-only subset.
#
# This used to live at data/parser.py. It's been moved to
# hacking/parser.py (alongside the other exploratory scripts) and its
# hardcoded input/output paths were repointed to ../data/... so it can
# run with hacking/ as the working directory. Verified via sha256 that
# the relocated script reproduces byte-identical output to what was
# checked in under data/ before the move.
#
# parser.py also now derives GABRA2_parsed.tsv (gene_id == "GABRA2",
# no header) from the same in-memory dataframe, right after the
# expensive GTF parse, rather than re-reading the GTF a second time.
# Verified via sha256 that this reproduces the previously checked-in
# GABRA2_parsed.tsv exactly.
#
# All three outputs come from one run of parser.py, so they share a
# single rule here.
# --------------------------------------------------------------

$(output_dir)/hg38_parsed.tsv $(output_dir)/hg38_parsed.parquet $(output_dir)/GABRA2_parsed.tsv: $(output_dir)/hg38.ncbiRefSeq.gtf $(hacking_dir)/parser.py
	cd $(hacking_dir) && python3 parser.py
