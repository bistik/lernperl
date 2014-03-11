#!/usr/bin/env perl

use strict;
use warnings;

my @favorite_poets = (
    'PubliusOvidiusNaso',
    'John Davidson',
    'Alfred, Lord Tennyson',
    'Christina Rossetti',
);

foreach my $poet (@favorite_poets) {
    print "$poet\n";
}
warn "We're done here";

