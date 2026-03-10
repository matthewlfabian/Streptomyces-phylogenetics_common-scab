rule FastQC_before:
    input:
        "FASTQs/raw/{sample}.gz"
    output:
        "results/FastQC/before/{sample}_FastQC.html"
    conda: "../envs/fastqc.yaml"
    threads: 10
    shell:
        "fastqc -t {threads} -o results/FastQC/raw/ {input}"

rule FastQC_after:
    input:
        "FASTQs/trimmed/{sample}.gz"
    output:
        "results/FastQC/trimmed/{sample}_FastQC.html"
    threads: 10
    conda: "../envs/fastqc.yaml"
    shell:
        "fastqc -t {threads} -o results/FastQC/after/ {input}"
