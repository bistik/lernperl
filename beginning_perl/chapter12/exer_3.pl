#!/usr/bin/env perl 

use strict;
use warnings;

use lib 'lib';
use Person::Customer;

my $c = Person::Customer->new({
        name => "Erick",
        birthdate => DateTime->new({
                year  => 1996,
                month => 5,
                day   => 7,
            }),
});

print $c->age;


