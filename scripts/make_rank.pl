#!/usr/bin/perl

use strict;

# The script reads the frequency spectrum and outputs the rank list.

# ./make_zipf.pl < spectrum.csv > zipf.csv


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
my ($freq,$rank);
$rank=0;
for $freq (sort {$b<=>$a} keys %spectrum){
    $rank+=$spectrum{$freq};
    print join("\t",$rank,$freq)."\n";
}
