#!/usr/bin/perl

use strict;
use locale;

# The script reads the abbreviated rank list of types and outputs the
# list of frequencies of type frequencies.

my ($orank,$ocount)=(0,0);
while(<>){
    chomp;
    my ($rank,$count)=split;
    my $fof=$rank-$orank;
    print "$count $fof\n";
    ($orank,$ocount)=($rank,$count);
}
