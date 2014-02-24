#!/usr/bin/env perl 

use strict;
use warnings;

use lib 'lib';
use Person;
use DateTime;

my $birthdate = DateTime->new(
        year  => 1983,
        month => 05,
        day   => 07,
);

my $person = Person->new({
        name => "Erick",
        birthdate => $birthdate,
});

print $person->age;
