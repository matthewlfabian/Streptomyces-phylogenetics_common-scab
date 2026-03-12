# Steps: FastQC & report => trimming via BBDuk => FastQC & report => SPAdes => FastANI/MLSA/BLAST
# FastQC trimming, raw FASTQs: tested & working v9.16.3

configfile: "config/config.yaml"

SAMPLES = config["samples"]

include: "rules/FastQC.smk"

rule all:
    input:
        expand("FastQC/raw/{sample}_1_fastqc.html", sample=SAMPLES),
        expand("FastQC/raw/{sample}_2_fastqc.html", sample=SAMPLES),
#        expand("FastQC/trimmed/{sample}_1_fastqc.html", sample=SAMPLES),
#        expand("FastQC/trimmed/{sample}_2_fastqc.html", sample=SAMPLES)
