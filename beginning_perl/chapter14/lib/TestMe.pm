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
    my %seen;
    my @unique;

    foreach my $num ( @array ) {
        next if $seen{$num}++;
        push @unique => $num;
    }
    return @unique;
}

sub unique_random {
    my %hash = map { $_ => 1 } @_;
    return keys %hash;
}

1;
