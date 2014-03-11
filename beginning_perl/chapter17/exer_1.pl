#!/usr/bin/env perl 

use strict;
use warnings;

use DateTime::Format::Strptime;
use DateTime;

my $datetime_formatter = DateTime::Format::Strptime->new(
    pattern     => '%Y-%m-%d',
    time_zone   => 'GMT',
);

print "birthdate? ";
my $birthdate = <STDIN>;
chomp $birthdate;
$birthdate = $datetime_formatter->parse_datetime($birthdate);

my $age = DateTime->now - $birthdate;
print "Age is " . $age->years . " years\n";

