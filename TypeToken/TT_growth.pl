#!/usr/bin/perl

use strict;
use locale;

# The script reads the list of tokens and outputs the growth of the
# number of types w.r.t. the number of tokens.

my %hash;
my ($tokens,$types)=(0,0);
while(<>){
    chomp; 
    my $w=$_;
    #print "$_\n";
    $tokens++;
    if(!exists $hash{$w}){
	$types++;
	print "$tokens $types $w\n";
	undef $hash{$w};
    }
}
print "$tokens $types\n";
