# Fetches GABRAA2 gene

from Bio import Entrez, SeqIO

Entrez.email = "your_email@example.com"
handle = Entrez.efetch(db="nucleotide", 
                       id="NC_000004.12", # Chromosome 4 (GRCh38)
                       rettype="fasta", 
                       retmode="text", 
                       seq_start=46243548, 
                       seq_stop=46390300)

record = SeqIO.read(handle, "fasta")
with open("NC_000004.12.txt", "w") as fp:
    print(record.seq, file=fp)

# print(len(record.seq)) # This will output 146753

