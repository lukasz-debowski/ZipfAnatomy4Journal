#!/usr/bin/perl

use strict;
# use locale;
# use utf8;

# The script uniqs items in a frequency list.

# cat in_file | T_normalize.pl | sort -k 2 | T_uniq.pl | sort -nr > out_file

# cat nkjp300M_counts_sorted.tab.xz | unxz | T_normalize.pl | sort -k 2 | T_uniq.pl | sort -nr | xz > nkjp300M_counts_sorted_normalized.tab.xz

my $row=0;
my $otype;
my $ocount=0;
while(<>){
    $row++;    
    chomp;
    $_=$row." ".$_;
    my ($rank,$count,$type)=split;
    if(($type ne $otype)&&($ocount>0)){
	print $ocount." ".$otype."\n";
	$ocount=0;
	$otype=$type;
    }
    $ocount+=$count;
}
print $ocount." ".$otype."\n";
