# TypeToken - Perl scripts for processing word frequency lists

These scripts are designed to operate in pipes.

## Piping scheme

 [frequency list] => TT_ranks_from_no_ranks.pl => TT_ranks_short.pl => TT_fof.pl => TT_TT_growth_short_hapaxes_expected.pl 
 [list of tokens] => TT_ranks.pl => TT_ranks_short.pl => TT_fof.pl => TT_TT_growth_short_hapaxes_expected.pl
 [list of tokens] => TT_growth.pl
 [list of tokens] => TT_growth_short.pl
 [list of tokens] => TT_growth_short_hapaxes.pl

 [list of tokens] - a file of tokens separated by newlines
 [frequency list] - a sorted list of "frequency type"  separated by newlines

 cat [frequency list] | T_normalize.pl | sort -k 2 | T_uniq.pl | sort -nr > [frequency list]

## Short script descriptions

 TT_ranks_from_no_ranks.pl - adds ranks to a sorted frequency list

 TT_ranks.pl - makes the rank list of types

 TT_ranks_short.pl - makes the abridged rank list of types

 TT_fof.pl - makes the list of frequencies of type frequencies

 TT_growth.pl - computes the vocabulary curve

 TT_growth_short.pl - computes a sparse vocabulary curve

 TT_growth_short_hapaxes.pl - computes a sparse vocabulary and hapax curve

 TT_growth_short_hapaxes_expected.pl - computes a sparse expected vocabulary and hapax curve

