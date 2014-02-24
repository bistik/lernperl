#!/usr/bin/env perl 

use strict;
use warnings;

use lib 'lib';
use DateTime;
use Person;

my $person = Person->new({
        name        => 'Bertrand Russell',
        birthdate   => DateTime->new(
            year  => 1872,
            month => 5,
            day   => 18,
        ),
});

print $person->name, ' is ', $person->age, ' years old';



