#!/usr/bin/perl

use strict;
# use locale;

# The script reads the list of frequencies of type frequencies and and
# outputs the expected growth of the number of types and hapaxes
# w.r.t. the number of types.


my %fof;
my $max_tokens;
my $max_types;
while(<>){
    chomp;
    my ($count,$fof)=split;
    $fof{$count}=$fof;
    $max_tokens+=$fof*$count;
    $max_types+=$fof;
}

my $tokens=1;
while($tokens<$max_tokens){
    my $types=$max_types;
    my $hapaxes=0;
    my $count;
    for $count (keys %fof){
	$types-=$fof{$count}*(1-$tokens/$max_tokens)**$count;
	$hapaxes+=$count*$fof{$count}*$tokens/$max_tokens*(1-$tokens/$max_tokens)**($count-1);
    }
    print "$tokens $types $hapaxes\n";
    $tokens*=1.1;
}
