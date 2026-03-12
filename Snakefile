configfile: "config/config.yaml"

SAMPLES = config["samples"]

include: "rules/fastqc.smk"

rule all:
    input:
        expand("FastQC/raw/{sample}_1_fastqc.html", sample=SAMPLES),
        expand("FastQC/raw/{sample}_2_fastqc.html", sample=SAMPLES),
        expand("FastQC/trimmed/{sample}_1_fastqc.html", sample=SAMPLES),
        expand("FastQC/trimmed/{sample}_2_fastqc.html", sample=SAMPLES)
