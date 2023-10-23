# Supplementary materials for article "Corrections of Zipf's and Heaps' Laws Derived from Hapax Rate Models".

This directory contains the scripts, the input files, and the output
files --- including the plots and the supplementary report.

## Supplementary report

The supplementary report is located in file zipf_anatomy_supp.pdf.

## Input files

The input files are 14 texts from the Gutenberg corpus projected to 26
letters and a space (27 distinct characters in total). They are
located in directory gutenberg/.

## Scripts

The scripts for repeating the experiment are located in directories
scripts/ and TypeToken/. To repeat the experiment run:

cd ./scripts/
./make.bash

In particular, the final Latex arrays are produced by scripts
make_parameters_herdan_1.pl and make_parameters_herdan_2.pl, called by
make.bash.

## Output files

The output files such as text tables and PDF figures are located in
the respective subdirectories of directory output/. Each Project
Gutenberg text has its own directory, named accordingly.
Additionally, directory output/ contains the PDF image for a figure
of a U-shaped hapax rate function, which does not depend on empirical
data.