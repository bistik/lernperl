use Test::Most;
use Carp 'croak';

sub reciprocal {
    my $number = shift;

    if (ref $number) {
        croak("Argument to reciprocal() must be a number");
    }
    return 1 / $number;
}

throws_ok { reciprocal([]) }
    qr/Argument to reciprocal\(\) must be a number/,
    'Passing non-numbers to reciprocal() should fail';

diag reciprocal([]);

done_testing;

