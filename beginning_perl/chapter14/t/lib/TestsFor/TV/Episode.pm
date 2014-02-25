package TestsFor::TV::Episode;

use Test::Most;
use base 'TestsFor';

sub attributes : Tests(14) {
    my $test = shift;
    my %default_attributes = (
        series          => 'Firefly',
        director        => 'Marita Grabiak',
        title           => 'Jaynestown',
        genre           => 'awesome',
        season          => 1,
        episode_number  => 7,
    );

    my $class = $test->class_to_test;
    my $episode = $class->new(%default_attributes);
    while ( my ($attribute, $value) = each %default_attributes) {
        can_ok $episode, $attribute;
        is $episode->$attribute, $value,
            "The values for '$attribute' should be correct";
    }
    my %attributes = %default_attributes; # copy
    foreach my $attribute (qw/season episode_number/) {
        $attributes{$attribute} = 0;
        throws_ok { $class->new(%attributes) }
            qr/\Q($attribute) does not pass the type constraint/,
                "Setting $attribute to less than zero should fail";
    }
}

1;

