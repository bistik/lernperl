package TestMe;

use strict;
use warnings;

use DateTime;
use Carp 'croak';
use Exporter::NoWork;

sub reciprocal { 
    my $number = shift;
    unless ($number) {
        croak("Illegal division by zero");
    }
    return 1 / $number;
}

sub order_date {
    my $today = DateTime->now->subtract( days => rand(30) );
    return sprintf "%02d/%02d/%04d" => map { $today->$_ } qw/month day year/;
}

sub unique {
    my @array = @_;
    my %hash = map { $_ => 1 } @array;
    return keys %hash;
}

1;
