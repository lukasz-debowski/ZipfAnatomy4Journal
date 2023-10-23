#!/bin/bash

mkdir ../output/herdan/
cd ../output/herdan/

for i in ../../gutenberg/*.txt.gz	 
do
    echo $i
    mkdir "$(basename "$i" .txt.gz)"
    #zcat $i | perl -pe "s/\s+/\n/g;" | ../../TypeToken/TT_growth_short.pl > "$(basename "$i" .txt.gz)/herdan.csv"
    zcat $i | perl -pe "s/\s+/\n/g;" | ../../TypeToken/TT_growth_short_hapaxes.pl > "$(basename "$i" .txt.gz)/herdan_hapaxes.csv"
    zcat $i | perl -pe "s/\s+/\n/g;" | ../../TypeToken/TT_ranks.pl | ../../TypeToken/TT_ranks_short.pl > "$(basename "$i" .txt.gz)/zipf.csv"
done

cd ../../scripts/
