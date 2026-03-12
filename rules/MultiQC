rule MultiQC_raw:
    input:
        expand("FastQC/raw/{sample}_1_fastqc.html", sample=SAMPLES),
        expand("FastQC/raw/{sample}_2_fastqc.html", sample=SAMPLES)
    output:
        "MultiQC/raw/multiqc_report.html"
    conda: "../envs/MultiQC.yaml"
    shell:
        "multiqc FastQC/raw/ -o MultiQC/raw/"
