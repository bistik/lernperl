#!/usr/bin/env perl 

use strict;
use warnings;

use WWW::Mechanize;
use HTML::TableExtract;

my $url = 'http://localhost:5000/';
my $mech = WWW::Mechanize->new;
$mech->get($url);
$mech->follow_link( text_regex => qr/click here/i );
$mech->submit_form(
    form_number => 1,
    fields => {
        name => 'Bob',
        profession => 'redshirt',
        birthplace => 'mars',
    },
);

my $extractor = HTML::TableExtract->new;
$extractor->parse($mech->content);

foreach my $table ( $extractor->tables ) {
    foreach my $row ( $table->rows ) {
        printf "%-20s - %s\n" => @$row;
    }
}
