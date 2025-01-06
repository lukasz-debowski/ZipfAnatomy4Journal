#!/bin/bash

for i in ~/korpusy/gutenberg/english/27_chars/*.txt
do
    echo $i
    mkdir "herdan/$(basename "$i" .txt)"
    #cat $i | perl -pe "s/\s+/\n/g;" | ./TypeToken/TT_growth_short.pl > "herdan/$(basename "$i" .txt)/herdan.csv"
    cat $i | perl -pe "s/\s+/\n/g;" | ./TypeToken/TT_growth_short_hapaxes.pl > "herdan/$(basename "$i" .txt)/herdan_hapaxes.csv"
    cat $i | perl -pe "s/\s+/\n/g;" | ./TypeToken/TT_ranks.pl | ./TypeToken/TT_ranks_short.pl > "herdan/$(basename "$i" .txt)/zipf.csv"
done
