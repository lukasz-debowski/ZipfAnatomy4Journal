#!/usr/bin/perl

use strict;
use Round;

undef $/;

$_=<>;

my @records=split m|\s*==> |, $_;

print join("\t& ","File",
	   "Constant",
	   "Davis",
	   "Logistic","","",
	   "Linear","",
	   "Length")."\\\\\n";
print join("\t& ","",
	   "\$\\beta\$",
	   "\$\\alpha\$",
	   "\$\\gamma\$","\$\\beta\$","\$\\alpha\$",
	   "\$\\gamma\$","\$\\alpha\$",
	   "\$N\$")."\\\\\n";
print "\\hline\n";
my ($MConstant,
    $MDavis,
    $MLogisticG,$MLogisticB,$MLogisticA,
    $MLinearG,$MLinearA,
    $Mn);
my $r;
my $rs;
for $r (sort @records){
    if($r=~m|^herdan\/(\S+)_27\/parameters\.txt <==[^=]+beta=(\S+)[^=]+alpha=(\S+)[^=]+gamma=(\S+)[^=]+beta=(\S+)[^=]+alpha=(\S+)[^=]+gamma=(\S+)[^=]+alpha=(\S+)[^=]+n=(\S+)|){
	my ($text,
	    $Constant,
	    $Davis,
	    $LogisticG,$LogisticB,$LogisticA,
	    $LinearG,$LinearA,
	    $n)=
	    ($1,$2,$3,$4,$5,$6,$7,$8,$9);
	print join("\t& ","$text.txt",
		   round(0.001,$Constant),
		   round(0.01,$Davis),
		   round(0.001,$LogisticG),round(0.001,$LogisticB),round(0.01,$LogisticA),
		   round(0.0001,$LinearG),round(0.01,$LinearA),
		   round(1,$n))."\\\\\n";
	$MConstant+=$Constant;
	$MDavis+=$Davis;
	$MLogisticG+=$LogisticG;
	$MLogisticB+=$LogisticB;
	$MLogisticA+=$LogisticA;
	$MLinearG+=$LinearG;
	$MLinearA+=$LinearA;
	$Mn+=$n;
	$rs++;
    }
}
print "\\hline\n";
$MConstant=$MConstant/$rs;
$MDavis=$MDavis/$rs;
$MLogisticG=$MLogisticG/$rs;
$MLogisticB=$MLogisticB/$rs;
$MLogisticA=$MLogisticA/$rs;
$MLinearG=$MLinearG/$rs;
$MLinearA=$MLinearA/$rs;
$Mn=$Mn/$rs;
print join("\t& ","Mean",
	   round(0.001,$MConstant),
	   round(0.01,$MDavis),
	   round(0.001,$MLogisticG),round(0.001,$MLogisticB),round(0.01,$MLogisticA),
	   round(0.0001,$MLinearG),round(0.01,$MLinearA),
	   round(1,$Mn))."\\\\\n";
    
# Constant model:
# beta=0.756394329866848
# Davis model:
# alpha=16.6987822811094
# Logistic model:
# gamma=0.579152996130324
# beta=0.518092655206868
# alpha=9.95471616047534
# Linear model:
# gamma=0.0260467911767246
# alpha=0.736151211241427
# The number of tokens:
# n=1068889202.0
