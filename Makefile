# --------------------------------------------------------------
# Preliminary Makefile
# More to do
# The intent here is to document how we set up the data 
# directory and make it so other users of this repo can re-create
# it since it's not checked in.
# --------------------------------------------------------------

output_dir := ./data

all: $(output_dir)/GABRA2.fa

bar: $(output_dir)/bar

$(output_dir)/bar:
	@echo Making bar...
	@mkdir -p $(output_dir)
	@echo foo > $@

$(output_dir)/GABRA2.fa: $(output_dir)/chr4.gb
	bio fasta $(output_dir)/chr4.gb --gene GABRA2 > $@

$(output_dir)/chr4.gb:
	@echo Making $@
	bio fetch NC_000004.12 > $@

