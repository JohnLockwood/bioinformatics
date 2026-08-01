from Bio import Entrez

Entrez.email = "your.email@example.com"
gene_symbol = "GABRA2"

# Step 1: Resolve Symbol to Numeric Gene ID
search_handle = Entrez.esearch(db="gene", term=f"{gene_symbol}[Gene Name] AND human[Organism]")
search_results = Entrez.read(search_handle)
gene_id = search_results["IdList"][0]  # E.g., '2561'

# Step 2: Fetch the Gene Summary
summary_handle = Entrez.esummary(db="gene", id=gene_id)
summary_results = Entrez.read(summary_handle)

# Step 3: Extract Genomic Accession and Offsets
# BioPython parses the XML into nested dictionaries/lists
document_summary = summary_results["DocumentSummarySet"]["DocumentSummary"][0]
genomic_info = document_summary["GenomicInfo"][0]

accession = genomic_info["ChrAccVer"]  # e.g., 'NC_000004.12'
start = genomic_info["ChrStart"]
stop = genomic_info["ChrStop"]

print(f"ID: {gene_id} | Accession: {accession} | Start: {start} | Stop: {stop}")