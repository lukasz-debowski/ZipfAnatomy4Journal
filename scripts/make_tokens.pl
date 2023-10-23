#!/usr/bin/perl

use strict;

my $oldrank=0;
while(<>){
    chomp;
    my ($rank,$freq)=split;
    print join("\t",$rank,$freq,$freq*($rank-$oldrank))."\n";
    $oldrank=$rank;
}
