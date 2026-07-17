---
date: 2026-07-16
model: Gemini 1.5 Pro
---

# Genome-Wide Significance and Multiple Testing

## User Prompt
I noticed the P-values in the study abstract seem small, but saw this in the introduction: "Using the conventional genome-wide significance (GWS)
criterion for GWAS (Pp 5 10 8), few studies have reported
AD-relevant GWS."  Can you comment on how in a GWS one might determine  such a P-Value?

## AI Response
That is a very sharp observation. When you are used to seeing a standard P-value threshold of 0.05 in scientific literature, a number as tiny as 5 x 10^-8 looks almost impossibly strict. However, in the context of a Genome-Wide Association Study (GWAS), this extreme threshold is absolutely necessary to separate real biological signals from mathematical noise [[1]](https://pmc.ncbi.nlm.nih.gov/articles/PMC2865585/).

Here is exactly why that number is used and how it is determined:

### The Multiple Testing Problem
In a standard clinical trial, a researcher might test a single hypothesis (e.g., "Does this drug work?"). If they use a significance level (alpha) of 0.05, there is a 5% chance that a positive result is just a statistical fluke (a false positive). 

However, in a GWAS, researchers aren't just testing one hypothesis. They are looking at hundreds of thousands, or even millions, of individual genetic variants (SNPs) across the entire genome to see if any of them correlate with a trait—like alcohol dependence [[1]](https://pmc.ncbi.nlm.nih.gov/articles/PMC2865585/). If you run 1,000,000 independent statistical tests and keep your threshold at 0.05, you would expect 50,000 false positives purely by random chance. 

### The Bonferroni Correction
To fix this, researchers apply a rigorous statistical adjustment called the **Bonferroni correction** [[2]](https://pmc.ncbi.nlm.nih.gov/articles/PMC4334751/). This method controls the false positive rate across the entire study by dividing the standard significance level by the number of independent tests being performed.

Early in the history of GWAS, scientists calculated that because of genetic linkage (the tendency of DNA sequences that are close together on a chromosome to be inherited together), the human genome of European ancestry contains approximately 1,000,000 independent blocks of common variation [[2]](https://pmc.ncbi.nlm.nih.gov/articles/PMC4334751/). 

Using the Bonferroni correction with this estimate gives us the conventional formula for genome-wide significance:

$$\alpha_{adjusted} = \frac{0.05}{1,000,000} = 5 \times 10^{-8}$$

### Bringing It Back to Your Study
Because this threshold is such a massive hurdle, it takes extremely large sample sizes and powerful genetic effects to reach it. This is exactly what the authors of your paper meant when they noted that very few studies had previously reported genome-wide significant (GWS) findings for alcohol dependence. By using a cutoff this strict, researchers ensure that any variants they *do* identify (like the ones they highlight on chromosomes 2 and 4) are highly likely to be genuine genetic risk factors rather than statistical accidents.