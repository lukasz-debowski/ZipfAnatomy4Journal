#!/usr/bin/perl

use strict;

# The script reads the frequency spectrum and outputs a sparse rank list.

# ./make_zipf_sparse.pl < spectrum.csv > zipf_sparse.csv

my $threshold=0.85;

my $tokens;
my $types;
my %spectrum;
while(<>){
    chomp;
    my ($freq,$spectrum)=split;
    $spectrum{$freq}=$spectrum;
    $types+=$spectrum;
    $tokens+=$freq*$spectrum;
}

print join("\t","#",$tokens)."\n";
my $previous_freq=0;
my $freq;
my $rank=0;
for $freq (sort {$b<=>$a} keys %spectrum){
    $rank+=$spectrum{$freq};
    if(($previous_freq==0)||($freq<$threshold*$previous_freq)){
	print join("\t",$rank,$freq)."\n";
	$previous_freq=$freq;
    }
}

