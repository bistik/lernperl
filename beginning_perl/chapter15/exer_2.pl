#!/usr/bin/env perl 

use strict;
use warnings;

use WWW::Mechanize;
use HTML::TableExtract;
use List::Util qw(min max sum);

my $url = 'http://localhost:5000/';
my $mech = WWW::Mechanize->new;
my (@str, @int, @health);
for (1..100) {
    $mech->get($url);
    $mech->follow_link( text_regex => qr/click here/i );
    $mech->submit_form(
        form_number => 1,
        fields => {
            name => 'Bob',
            profession => 'programmer',
            birthplace => 'earth',
            education => 'engineering'
        },
    );

    my $extractor = HTML::TableExtract->new;
    $extractor->parse($mech->content);

    foreach my $table ( $extractor->tables ) {
        foreach my $row ( $table->rows ) {
            my ($attr, $value) = @$row;
            push @str => $value if $attr eq 'Strength';
            push @int => $value if $attr eq 'Intelligence';
            push @health => $value if $attr eq 'Health';
        }
    }
}

printf "%-20s - %s\n" => 'Min Strength', min @str;
printf "%-20s - %s\n" => 'Min Intelligence', min @int;
printf "%-20s - %s\n" => 'Min Health', min @health;

printf "%-20s - %s\n" => 'Max Strength', max @str;
printf "%-20s - %s\n" => 'Max Intelligence', max @int;
printf "%-20s - %s\n" => 'Max Health', max @health;

printf "%-20s - %s\n" => 'Ave Strength', (sum @str)/100;
printf "%-20s - %s\n" => 'Ave Intelligence', (sum @int)/100;
printf "%-20s - %s\n" => 'Ave Health', (sum @health)/100;
