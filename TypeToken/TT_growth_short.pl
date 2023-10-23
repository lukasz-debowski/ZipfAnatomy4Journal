#!/usr/bin/perl

use strict;
use locale;

# The script reads the list of tokens and outputs the growth of the
# number of types w.r.t. the number of tokens.

my %hash;
my ($tokens,$types)=(0,0);
my ($otokens,$otypes)=($tokens,$types);
while(<>){
    chomp; 
    my $w=$_;
    #print "$_\n";
    $tokens++;
    if(!exists $hash{$w}){
	$types++;
	undef $hash{$w};
    }
    if(($types>=1.1*$otypes)||($tokens>=1.1*$otokens)){
	print "$tokens $types\n";
	($otokens,$otypes)=($tokens,$types);
    }
}
print "$tokens $types\n";
