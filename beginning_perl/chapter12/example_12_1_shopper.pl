#!/usr/bin/env perl 

use strict;
use warnings;

use lib 'lib';
use Shopper::Personal;

my $shopper = Shopper::Personal->new({
    name   => 'Erick',
    budget => 10,
});

$shopper->buy(
    'beer',
    'Ferrari',
    ('coffee') x 2,
    ('ravioli') x 2,
    'beer',
);
print $shopper->get_invoice;

