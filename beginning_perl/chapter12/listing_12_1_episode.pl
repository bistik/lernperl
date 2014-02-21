#!/usr/bin/env perl 

use strict;
use warnings;

use lib 'lib';
use TV::Episode::Broadcast;
use DateTime;

my $broadcast = TV::Episode::Broadcast->new(my $attr = {
    series          => 'Firefly',
    director        => 'Marita Grabiak',
    title           => 'Jaynestown',
    genre           => 'awesome',
    season          => 1,
    episode_number  => 9,
    broadcast_date  => DateTime->new(
        year  => 2002,
        month => 11,
        day   => 15,
    )
});

print $broadcast->as_string;
print $broadcast->series;
