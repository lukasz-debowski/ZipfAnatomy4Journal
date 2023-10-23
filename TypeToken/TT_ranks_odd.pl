#!/usr/bin/perl

use strict;
use locale;

# The script reads the list of tokens and outputs the rank list of
# types. The list is enriched with the counts of types for decimated
# sublists of tokens.

my ($bins,$tokens)=(shift,shift);

my %count;
my %countB;
my %Hcount;
my %HcountB;
my ($bin,$token)=(0,0);
while(<>){
    chomp;
    $Hcount{$_}++;
    $HcountB{$_}[$bin]++;
    $token++;
    if($token>=$tokens){
	$token=0;
	$count{$_}++;
	$countB{$_}[$bin]++;
	$bin++;
	if($bin>=$bins){
	    my ($mbin,$type);
	    for $type (keys %Hcount){
		$count{$type}+=$Hcount{$type};
	    }
	    for $type (keys %HcountB){
		for $mbin (0..$bins-1){
		    $countB{$type}[$mbin]+=$HcountB{$type}[$mbin];
		}
	    }
	    %Hcount=();
	    %HcountB=();
	    $bin=0;
	}
    }
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
    my ($var,$mbin);
    for $mbin (0..$bins-1){
	$var+=($count{$type}/$bins-$countB{$type}[$mbin])**2;
    }
    $var=$var*$bins/($bins-1);
    print "$rank $count{$type} $type $var ",join(" ",@{$countB{$type}}),"\n";
}
