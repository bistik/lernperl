package TestsFor::Customer;

use Test::Most;
use base 'TestsFor::Person';
use Customer;
use DateTime;

sub class_to_test { 'Customer' }

sub minimum_age : Tests(2) {
    my $test = shift;
    my $year = DateTime->now->year;
    $year -= 16;

    throws_ok {
        $test->class_to_test->new(
            given_name  => 'Sally',
            family_name => 'Forth',
            birthdate   => "$year-06-05",
        );
    }
    qr/^Customers must be 18 years old or older, not \d+/,
    'Trying to create a customer younger than 18 should fail';

    $year -= 10;
    lives_ok {
        $test->class_to_test->new(
            given_name  => 'Sally',
            family_name => 'Forth',
            birthdate   => "$year-06-05",
        );
    }
    'Trying to create a customer older than 18 should succeed';
}

1;
