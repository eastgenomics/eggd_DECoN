<!-- dx-header -->
# DECoN (DNAnexus Platform App)

Dx wrapper to run the DeCON CNV caller

This is the source code for an app that runs on the DNAnexus Platform.

<!-- Insert a description of your app here -->
## What does this app do?
Calls copy number variants (CNV) from a list of samples based on variation in read depth.

## What are typical use cases for this app?
This app may be executed as a standalone app or as part of an analysis pipeline.

## What data are required for this app to run?
This app requires
* array of sample.bam and sample.bai files (in the same directory)
* output prefix (eg. run name/date, etc)
* targeted 1-based BED file (sorted in chromosome order, no header but tab-separated columns for chrom→start→end→gene)
* reference genome FASTA file
* exon numbering tsv file for annotation (optional)
* true/FALSE whether custom exon annotation is provided and custom reports should be generated (defaults to false)

Values to filter out low quality calls, calculate coverage and call variants:
* minimum correlation threshold (default 0.98)
* minimum coverage threshold (default 100x)
* transition probability in HMM (default 0.01)

## What does this app output?
* sample coverage .RData file listing all samples and coverage values
* _Failures.txt: list of samples below quality thresholds
* _summary.RData containing the FPKM for each sample and exon, all CNV calls, and quality control information
* CNV_all.txt a tsv file detailing exon CNV calls
* a folder of coverage plots as pdf

## Dependencies
The app includes a tar.gz of the executable DECoN R scripts.

### This app was made by East GLH
