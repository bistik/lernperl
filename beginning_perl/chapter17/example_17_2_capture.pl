#!/usr/bin/env perl 

use strict;
use warnings;

use Data::Dumper;
use Capture::Tiny 'capture';

# $^X name of current perl executable
print "\$^X $^X";
my $program = "$^X example_17_1_poets.pl";
my ($stdout, $stderr, @result) = capture { qx"$program" };

print Dumper $stdout, $stderr, \@result;

