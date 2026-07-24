---
date: 2026-07-16
model: Gemini 1.5 Pro
---
# Resources for the Bioinformatics of Alcohol Use Disorder

## User Prompt
#### Output Formatting Rules
* Enclose all responses entirely within a Markdown code block to prevent web UI rendering artifacts and preserve the raw source format.
* Begin every response with a YAML frontmatter header enclosed by opening and closing triple dashes (`---`), with each set of dashes on its own dedicated line.
* Ensure keys and values within the YAML block are plain text and contain absolutely zero Markdown tags.
* Include a `date` key calculated for Eastern Standard Time (completely dropping the time zone abbreviation) and a `model` key accurately reflecting the specific Gemini model and version.
* Ensure there is exactly one single space after the colon separating the key and the value in the YAML header.
* Output a primary generated title using an H1 (`#`) tag immediately after the closing YAML dashes.
* Below the primary title, include a `## User Prompt` section that exactly echoes the user's input.
* Below the prompt section, include an `## AI Response` section containing the generated answer.
* **Web Research Citations:** Use the numeric bracketed (IEEE) style for all inline web links (e.g., `[[1]](https://example.com)`).
* **Authoritative Grounding Requirement:** For all biological, medical, or scientific inquiries, prioritize live web grounding over internal training data. You must actively query and cite authoritative databases (e.g., PubMed, NCBI, WHO, or peer-reviewed `.edu`/`.gov` domains). If a scientific claim cannot be directly verified via a live, authoritative external source, you must explicitly state that the information is unverified before providing it.

If I were to do a practice bioinformatics project  where I compare variants of genes that increase or decrease susceptibility to AUD, what labeled datasets are available?  What studies should I read to find more about the relevant variants?

## AI Response
As an AI, I am happy to help you structure your literature review and identify authoritative datasets for your practice bioinformatics project. Conducting a bioinformatic analysis on Alcohol Use Disorder (AUD) is an excellent way to learn, given the polygenic nature of the condition and the wealth of publicly available genomic data. 

Here is a breakdown of the leading datasets you can utilize and the foundational studies you should read to familiarize yourself with the relevant genetic variants.

### Available Datasets for AUD Bioinformatics

For a practice project, you have access to both summary statistics (ideal for pathway analysis, polygenic risk scoring, and pleiotropy detection) and, if you apply for access, individual-level genotype data:

* **dbGaP (Database of Genotypes and Phenotypes):** Maintained by the NCBI, dbGaP is the primary repository for individual-level genotype and phenotype data. You can apply for access to cohorts explicitly designed for AUD research:
    * **COGA (Collaborative Study on the Genetics of Alcoholism):** A deeply phenotyped, family-based longitudinal cohort that includes genomic, neurophysiological, and clinical data. Access to COGA data (e.g., phs000125, phs000763) is available through dbGaP or via application to the NIAAA (Agrawal et al., 2023).
    * **SAGE (Study of Addiction: Genetics and Environment):** A widely used dataset frequently combined with other cohorts to identify novel risk loci for alcohol dependence (Gelernter et al., 2013).
* **The NHGRI-EBI GWAS Catalog:** If you prefer to bypass applying for individual-level data, the GWAS Catalog `[[1]](https://www.ebi.ac.uk/gwas/)` is a publicly accessible database providing comprehensive summary statistics from published genome-wide association studies. Researchers frequently use machine learning and bioinformatic pipelines against this catalog to identify pleiotropic variants shared among substance use disorders (Peng et al., 2020).
* **Million Veteran Program (MVP):** While accessing individual-level data requires strict clearances, summary statistics generated from MVP studies are often made available. The MVP cohort contains hundreds of thousands of participants and has been instrumental in modern AUD genome-wide association studies (Kranzler et al., 2019).

### Recommended Reading List

To understand the genetic architecture of AUD, including well-known loci like the alcohol-metabolizing enzyme genes (e.g., *ADH1B*, *ADH1C*) and complex neurobiological pathways, I recommend reviewing the following studies:

1.  **Foundational Review:** * Deak et al. (2019) provide an excellent overview of the heritability of AUD, the transition from candidate gene studies to GWAS, and how hundreds of small-effect variants contribute to its etiology (Deak et al., 2019).
2.  **Landmark GWAS Studies:** * Kranzler et al. (2019) is a vital paper that used the Million Veteran Program (N = 274,424) to identify 18 genome-wide significant loci associated with alcohol consumption and AUD diagnoses (Kranzler et al., 2019).
    * Icick et al. (2025) is a highly recent, multi-ancestry GWAS encompassing over 1 million individuals, highlighting novel risk variants and shedding light on cross-disorder pleiotropy (Icick et al., 2025).
    * Gelernter et al. (2013) details population-specific genetic associations, prominently confirming major risk loci mapped to the *ADH* gene cluster on chromosome 4 (Gelernter et al., 2013).
3.  **Systems Biology and Networks:** * Levchenko et al. (2022) is particularly relevant for a bioinformatics project. This study maps associated variants to functional biological networks, revealing that numerous genes associated with alcohol phenotypes directly interact in a network where Brain-Derived Neurotrophic Factor (*BDNF*) serves as a primary hub (Levchenko et al., 2022).

---

### References

Agrawal, A., Brislin, S. J., Bucholz, K. K., et al. (2023). The Collaborative Study on the Genetics of Alcoholism: Overview. *Genes, Brain and Behavior*, *22*. https://doi.org/10.1111/gbb.12864
Cited by: 31

Deak, J. D., Miller, A. P., & Gizer, I. R. (2019). Genetics of alcohol use disorder: a review. *Current Opinion in Psychology*, *27*, 56–61. https://doi.org/10.1016/j.copsyc.2018.07.012
Cited by: 106

Gelernter, J., Kranzler, H. R., Sherva, R., et al. (2013). Genome-wide association study of alcohol dependence:significant findings in African- and European-Americans including novel risk loci. *Molecular Psychiatry*, *19*, 41–49. https://doi.org/10.1038/mp.2013.145
Cited by: 449. NOTE:  AVAILABLE LOCALLY AS Genome-wide_association_study_.pdf



Icick, R., Shadrin, A., Holen, B., et al. (2025). Identification of risk variants and cross-disorder pleiotropy through multi-ancestry genome-wide analysis of alcohol use disorder. *Nature Mental Health*, *3*, 253–265. https://doi.org/10.1038/s44220-024-00353-8
Cited by: 4

Kranzler, H. R., Zhou, H., Kember, R. L., et al. (2019). Genome-wide association study of alcohol consumption and use disorder in 274,424 individuals from multiple populations. *Nature Communications*, *10*. https://doi.org/10.1038/s41467-019-09480-8
Cited by: 616

Levchenko, A., Malov, S., Antonik, A., et al. (2022). A Genome-Wide Association Study Reveals a BDNF-Centered Molecular Network Associated with Alcohol Dependence and Related Clinical Measures. *Biomedicines*, *10*, 3007. https://doi.org/10.3390/biomedicines10123007
Cited by: 13

Peng, Q., Wilhelmsen, K. C., & Ehlers, C. L. (2020). Common genetic substrates of alcohol and substance use disorder severity revealed by pleiotropy detection against GWAS catalog in two populations. *Addiction Biology*, *26*. https://doi.org/10.1111/adb.12877
Cited by: 19

---
Are you more interested in exploring raw sequence data for novel variant discovery, or would you prefer working with pre-calculated summary statistics to conduct pathway mapping and polygenic risk score analyses?