#!/usr/bin/perl

use strict;
# use locale;
# use utf8;

# The script selects items from a frequency list that match a regexp.

my ($re,$switch)=(shift,shift);

my $polish=qr/[abcdefghijklmnoprstuwyząęćłńóśźż]/;
my $foreign=qr/[qxv]/;
my $digit=qr/[1234567890]/;
my $punct=qr/[\.\;\,\:\?\!\-\(\)\"\'\[\]\„\”]/;
my $sign=qr/[■§\*@\+\|\=\%\/\&\>\<\_]/;
my $familiar=qr/(?:${polish}|${foreign}|${digit}|${punct}|${sign})/;

my $row;
while(<>){
    $row++;    
    chomp;
    $_=$row." ".$_;
    my ($rank,$count,$type)=split;
    if((($re eq "p")&&($type=~/^${polish}+$/))||
       (($re eq "d")&&($type=~/^${digit}+$/))||
       (($re eq "o")&&($type!~/^${familiar}+$/))){
	if($switch eq "yes"){
	    print $count." ".$type."\n";
	}
    }else{
	if($switch ne "yes"){
	    print $count." ".$type."\n";
	}
    }
}
