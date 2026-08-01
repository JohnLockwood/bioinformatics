# For context see https://gemini.google.com/app/e5619016d62d50b9 (private)
from Bio import Entrez

Entrez.email = "johnlockwood2999@gmail.com"

# Search for genes associated with the phenotype
handle = Entrez.esearch(db="gene", term='"alcohol dependence"[Disease/Phenotype] AND human[Organism]', retmax=50)
record = Entrez.read(handle)

print(f"Found {record['Count']} genes.")
print("Gene IDs:", record["IdList"])