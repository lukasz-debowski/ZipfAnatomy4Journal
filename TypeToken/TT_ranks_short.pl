#!/usr/bin/perl

use strict;
use locale;

# The script reads the rank list of types and outputs the abridged
# rank list of types.

my ($orank,$ocount);
while(<>){
    chomp;
    my ($rank,$count,$type)=split;
    if((defined $ocount)&&($ocount!=$count)){
	print "$orank $ocount\n";
    }
    ($orank,$ocount)=($rank,$count);
}
print "$orank $ocount\n";
