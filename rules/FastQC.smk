rule fastqc_before:
    input:
        r1 = "data/raw/{sample}_1.fastq.gz",
        r2 = "data/raw/{sample}_2.fastq.gz"
    output:
        html1 = "results/fastqc/before/{sample}_1_fastqc.html",
        html2 = "results/fastqc/before/{sample}_2_fastqc.html"
    threads: 10
    conda: "../envs/fastqc.yaml"
    shell:
        "fastqc -t {threads} -o results/fastqc/before/ {input.r1} {input.r2}"

rule fastqc_after:
    input:
        r1 = "data/trimmed/{sample}_1.fastq.gz",
        r2 = "data/trimmed/{sample}_2.fastq.gz"
    output:
        html1 = "results/fastqc/after/{sample}_1_fastqc.html",
        html2 = "results/fastqc/after/{sample}_2_fastqc.html"
    threads: 10
    conda: "../envs/fastqc.yaml"
    shell:
        "fastqc -t {threads} -o results/fastqc/after/ {input.r1} {input.r2}"
