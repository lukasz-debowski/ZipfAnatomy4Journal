#!/usr/bin/perl

use strict;
use locale;

# The script reads the sorted frequency list and outputs the rank list of
# types.

my $row;
while(<>){
    $row++;    
    $_=$row." ".$_;
    print $_;
}
