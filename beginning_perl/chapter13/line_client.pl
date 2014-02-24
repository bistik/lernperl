#!/usr/bin/env perl 

use lib 'lib';
use Point;
use Line;

my $line = Line->new({
        point1 => Point->new({ x => 1, y => -1 }),
        point2 => Point->new({ x => 1, y => -1 }),
        #point2 => Point->new({ x => 4, y => -5 }),
});

print $line->length;
