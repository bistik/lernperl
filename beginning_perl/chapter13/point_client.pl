#!/usr/bin/env perl 

use lib 'lib';
use Point;

my $point = Point->new({ x => 1.2, y => -7 });

printf "x:%f  y:%f\n" => $point->x, $point->y;

