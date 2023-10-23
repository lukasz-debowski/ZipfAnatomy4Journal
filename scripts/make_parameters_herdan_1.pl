#!/usr/bin/perl

use strict;
use Round;

undef $/;

$_=<>;

my @records=split m|\s*==> |, $_;

my $wssr="\$\\sqrt\{\\text\{WSSR\/ndf\}\}\$";
print join("\t& ","File","Constant","Davis","Logistic",
	   "Linear")."\\\\\n";
#print join("\t& ","",$wssr,$wssr,$wssr,$wssr)."\\\\\n";
print "\\hline\n";
my $r;
my @Mout;
my $rs;
for $r (sort @records){
    next if $r!~m|\*\*\*+|;
    #print $r;
    my (@list)=split m|\*\*\*+|, $r;
    my @out;
    if($list[0]=~m|^herdan\/(\S+)_27\/fit\.log <==|){
	$out[0]=$1.".txt";
    }
    my $i;
    for $i (1..4){
	if($list[$i]=~m|STDFIT[^:]*:\s+(\S+)\s+|){
	    $out[$i]=round(0.01,$1);
	}
    }
    my $imin=0;
    for $i (1..4){
	if(($imin==0)||($out[$i]<$out[$imin])){
	    $imin=$i;
	}
    }
    my @print=@out;
    $print[$imin]="\\textbf\{".$out[$imin]."\}";
    print join("\t& ",@print)."\\\\\n";
    for $i (1..4){
	$Mout[$i]+=$out[$i];
    }
    $rs++;
}
print "\\hline\n";
my @out;
$out[0]="Mean";
my $i;
for $i (1..4){
    $out[$i]=round(0.01,$Mout[$i]/$rs);
}
my $imin=0;
for $i (1..4){
    if(($imin==0)||($out[$i]<$out[$imin])){
	$imin=$i;
    }
}
my @print=@out;
$print[$imin]="\\textbf\{".$out[$imin]."\}";
print join("\t& ",@print)."\\\\\n";
    
# ==> herdan/00ws110_27/parameters.txt <==
# Constant model:
# beta=0.764157936533611
# Davis model:
# alpha=11.9777214047089
# Logistic model:
# gamma=0.207202727846758
# alpha=12.9820016147406
# Linear model:
# gamma=0.0399596918341491
# alpha=0.664920488393509
# The number of tokens:
# n=835726.0
