#!/usr/bin/env perl 

use strict;
use warnings;
use Data::Dumper;

my @strings = (
    'Dogma? I am God.',
    'I did, did I?',
    'Lager, sir, is regal.',
    'This is not a palindrome',
    'Murder for a jar of red rum.',
    'Reviled did I live, said I, as evil I did deliver.',
);

my %lengths = map { $_ => plength($_) } @strings;

print Dumper \%lengths;

sub plength {
    my ($word) = @_;
    $word =~ s/\W//g;
    $word = lc $word;
    return 0 unless $word eq reverse $word;
    return length $word;
}

