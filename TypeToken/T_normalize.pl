#!/usr/bin/perl

use strict;
# use locale;
# use utf8;

# The script normalizes items in a frequency list.

# cat in_file | T_normalize.pl | sort -k 2 | T_uniq.pl | sort -nr > out_file

# cat nkjp300M_counts_sorted.tab.xz | unxz | T_normalize.pl | sort -k 2 | T_uniq.pl | sort -nr | xz > nkjp300M_counts_sorted_normalized.tab.xz

my $polish=qr/[abcdefghijklmnopqrstuvwxyząęćłńóśźż\-\']/;
my $digit=qr/[1234567890\%]/;
my $punct=qr/[\.\;\,\:\?\!\-\(\)\"\'\[\]\„\”]/;
my $sign=qr/[■§\*@\+\|\=\%\/\&\>\<\_]/;
my $familiar=qr/(?:${polish}|${digit}|${punct}|${sign})/;

print STDERR "Reading and normalizing...\n";

sub normalize{
    my ($in)=@_;
    my $out=$in;
    $out=lc($out);
    $out=~m/((?:${polish}|${digit})+)/;
    $out=$1;
    if($out eq ""){
	$out="OOV";
	# print STDERR "$in\n";
    }
    return $out;
}

my $row=0;
while(<>){
    $row++;    
    chomp;
    $_=$row." ".$_;
    my ($rank,$count,$type)=split;
    my $normal=normalize($type);
    print $count." ".$normal."\n";
}
