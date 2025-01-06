package Round;

use strict;
#use warnings;

use Exporter;
our (@ISA, @EXPORT, @EXPORT_OK);
@ISA         = qw(Exporter);
@EXPORT      = qw( &round &frac &hyphen_undef );
@EXPORT_OK   = qw( );

# Procedure Round::round rounds numbers to the specified precision.
# Procedure Round::frac returns the rounded quotient of two numbers in a safe way: 
# If the denominator is zero, the quotient is returned as '/0';

sub round{
# rounds numbers to the specified precision
    my ($prec,$orig) = @_;
    my $quo=$orig/$prec;
    my $int=int($quo);
    my $dif=$quo-$int;
    my $res=($int+((abs($dif)>0.5)?($dif<=>0):0))*$prec;
    return $res; 
};

sub frac{
    my ($prec,$up,$down)=@_;
    if(($down>0)||($down<0)){
        return round($prec,$up/$down);
    }else{
        return '/0';
    }
}

sub hyphen_undef{
    my $arg=shift;
    return (!defined $arg)?'--':$arg;
}

1;
