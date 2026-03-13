# Streptomyces Phylogenetics - Common Scab

A Snakemake workflow for genome assembly, phylogenetic analysis, 
and gene presence/absence of Streptomyces species associated with 
common scab disease.

# Overview

This pipeline processes paired-end Illumina reads through the following stages:

Stage 1: Raw read quality assessment (FastQC, MultiQC)
Stage 2: Adapter and quality trimming (BBDuk)
Stage 3: Post-trimming quality assessment (FastQC, MultiQC)
Stage 4: Genome assembly (SPAdes)
Stage 5: Phylogenetic analysis (FastANI, MLSA, BLAST)

# Dependencies

All dependencies are managed automatically via Conda using the 
environment files in the `envs/` directory.

- Snakemake v9.16.3
- FastQC
- MultiQC
- BBDuk
- SPAdes
- FastANI
- BLAST



### Setup
1.) Clone the repository and activate the Snakemake environment:

  git clone https://github.com/yourusername/Streptomyces-phylogenetics_common-scab.git
  conda activate snakemake

2.) Edit `config/config.yaml` to include your strain/sample names. For example, for paired-end reads, 
strain/sample names from FASTQ files are identified as follows: <strain_1>_1.fastq.gz, <strain_1>_2.fastq.gz, <strain_2>_2.fastq.gz...

  samples:
    - SAMPLE1
    - SAMPLE2
    - ...

### Running the Pipeline

This pipeline is designed to be run in stages, allowing review of quality assessment results before proceeding to trimming and assembly. 

Snakemake automatically skips any step whose output file already exists.

#### Stage 1: Raw read quality assessment
Run FastQC and MultiQC on raw reads, then review the MultiQC report 
before proceeding to trimming:
```bash
snakemake --cores 10 --use-conda
```
Review `MultiQC/raw/multiqc_report.html` before continuing.

#### Stage 2 onwards: Trimming and assembly
Once satisfied with raw read quality, uncomment the Stage 2 targets 
in `rule all` of the `Snakefile` to proceed with trimming:
```python
# STAGE 2 - uncomment after reviewing MultiQC report
# expand("FASTQ/trimmed/{sample}_1.fastq.gz", sample=SAMPLES),
# expand("FastQC/trimmed/{sample}_1_fastqc.html", sample=SAMPLES),
# "MultiQC/trimmed/multiqc_report.html",
```
Rerun the pipeline — Snakemake will skip completed steps and only 
run the newly uncommented targets.

Repeat this process for each subsequent stage.

### Dry Run
To preview what Snakemake will run without executing anything:
```bash
snakemake --dry-run --cores 10 --use-conda
```

### Visualize the Pipeline
To generate a DAG image of the workflow:
```bash
snakemake --dag | dot -Tpng > docs/dag.png
```

## Directory Structure
```
Streptomyces-phylogenetics_common-scab/
├── Snakefile
├── config/
│   └── config.yaml
├── envs/
│   ├── FastQC.yaml
│   ├── MultiQC.yaml
│   └── BBDuk.yaml
├── rules/
│   ├── fastqc.smk
│   ├── MultiQC.smk
│   └── bbduk.smk
├── docs/
│   └── dag.png
└── README.md
```

## Author

Matthew Fabian
[Institution]
[Contact]
