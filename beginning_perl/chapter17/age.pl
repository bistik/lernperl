#!/usr/bin/env perl 

use strict;
use warnings;

use DateTime::Format::Strptime;
use DateTime;
use Getopt::Long;

my $datetime_formatter = DateTime::Format::Strptime->new(
    pattern     => '%Y-%m-%d',
    time_zone   => 'GMT',
);

my ($birthdate, $age_at) = (undef, DateTime->now);

GetOptions('--birthdate=s' => \$birthdate,
           '--age_at=s' => \$age_at
    ) or die "Cannot parse args $!";

$birthdate = $datetime_formatter->parse_datetime($birthdate);
$age_at    = $datetime_formatter->parse_datetime($age_at);

my @leftover; 
foreach my $leftover ( @ARGV ) {
    push @leftover => $leftover;
}

my $age = $age_at - $birthdate;
print "@leftover age is " . $age->years . " years\n";

