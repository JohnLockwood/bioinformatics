#!/usr/bin/env python3
"""Fetch a nucleotide record from NCBI Entrez and write it to a file."""
"""NOTE:  This is a work in progress!!!"""

import argparse
import os
from pathlib import Path

from Bio import Entrez, SeqIO


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Fetch a nucleotide record from NCBI Entrez"
    )
    parser.add_argument("gene_id", help="NCBI accession or identifier to fetch")
    return parser.parse_args()


def main() -> None:
    args = parse_args()

    bio_data_root = os.environ.get("BIO_DATA")
    if not bio_data_root:
        raise RuntimeError("BIO_DATA environment variable is not set.")

    output_dir = Path(bio_data_root).expanduser()
    output_dir.mkdir(parents=True, exist_ok=True)

    output_path = output_dir / f"{args.gene_id}.txt"
    Entrez.email = os.environ.get("ENTREZ_EMAIL", "your_email@example.com")

    handle = Entrez.efetch(
        db="nucleotide",
        id=args.gene_id,
        rettype="fasta",
        retmode="text",
        seq_start=46243548, 
        seq_stop=46390300)                       

    record = SeqIO.read(handle, "fasta")
    handle.close()

    with output_path.open("w", encoding="utf-8") as fp:
        print(record, file=fp)

    print(f"Wrote {output_path}")


if __name__ == "__main__":
    main()
