#!/usr/bin/env perl 

use strict;
use warnings;

use Text::CSV_XS;
my $file = 'example_18_1_jobs.csv';

open my $fh, '<', $file or die "Cannot open $file for reading: $!";

my $headers = <$fh>;
my $csv = Text::CSV_XS->new( { binary => 1, eol => $/ } ); # $/ is '\n'

while ( my $row = $csv->getline($fh) ) {
    printf "Name: %20s Age: %3d Occupation: %10s\n", @$row;
}
