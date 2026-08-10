import polars as pl
import re



def parse_gtf_to_polars(file_path):
    # Regex to capture the key and the value, stripping quotes and semicolons
    attr_pattern = re.compile(r'(\S+)\s+"?([^";]*)"?;?')
    records = []

    with open(file_path, 'r') as f:
        for line in f:
            if line.startswith("#"): 
                continue
                
            cols = line.strip().split('\t')
            if len(cols) != 9: 
                continue

            # Standard 8 GTF columns
            record = {
                "seqname": cols[0],
                "source": cols[1],
                "feature": cols[2],
                "start": int(cols[3]),
                "end": int(cols[4]),
                "score": cols[5],
                "strand": cols[6],
                "frame": cols[7]
            }

            # Dynamically parse the 9th column and merge it into the record
            attributes = dict(attr_pattern.findall(cols[8]))
            record.update(attributes)
            
            records.append(record)

    # Polars handles the superset of keys and inserts nulls for missing values automatically
    return pl.DataFrame(records)

# file_path = "delme.gtf"
file_path = "../data/hg38.ncbiRefSeq.gtf"

# Step 1: Parse the full GTF file. This is the expensive step (the file
# is ~800MB and has ~4.9 million lines), so it gets its own progress
# messages.
print(f"Step 1/4: Parsing {file_path} (this is the slow step)...")
df = parse_gtf_to_polars(file_path=file_path)
print(f"Step 1/4: Done. Parsed {df.height} rows.")

# Step 2: Save the full parsed GTF as tsv and parquet.
print("Step 2/4: Writing ../data/hg38_parsed.tsv...")
df.write_csv("../data/hg38_parsed.tsv", separator="\t")
print("Step 2/4: Writing ../data/hg38_parsed.parquet...")
df.write_parquet("../data/hg38_parsed.parquet")
print("Step 2/4: Done.")

# Step 3: Filter down to just the GABRA2 gene's rows. Doing this here,
# right after the expensive parse, avoids having to re-read/re-parse
# the GTF just to get this smaller, gene-specific view.
print("Step 3/4: Filtering for gene_id == GABRA2...")
gabra2_df = df.filter(pl.col("gene_id") == "GABRA2")
print(f"Step 3/4: Done. Found {gabra2_df.height} rows for GABRA2.")

# Step 4: Save the GABRA2-only rows. This mirrors how GABRA2_parsed.tsv
# was originally produced: no header, same column order/values as the
# full hg38_parsed.tsv.
print("Step 4/4: Writing ../data/GABRA2_parsed.tsv...")
gabra2_df.write_csv("../data/GABRA2_parsed.tsv", separator="\t", include_header=False)
print("Step 4/4: Done.")
