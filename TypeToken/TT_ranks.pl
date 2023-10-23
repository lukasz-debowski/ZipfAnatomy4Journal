#!/usr/bin/perl

use strict;
use locale;

# The script reads the list of tokens and outputs the rank list of
# types.

my %count;
while(<>){
    chomp;
    $count{$_}++;
}

sub my_cmp{
    my ($a,$b)=@_;
    return -1 if($count{$a}>$count{$b});
    return 1 if($count{$a}<$count{$b});
    return -1 if($a lt $b);
    return 1 if($a gt $b);
    return 0;
}    

my ($type,$rank);
foreach $type (sort {my_cmp($a,$b)} keys %count){    
    $rank++;
    print "$rank $count{$type} $type\n";
}
