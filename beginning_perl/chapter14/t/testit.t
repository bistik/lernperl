use strict;
use warnings;

use Test::More;
use Test::Differences;
use Test::Exception;

use lib 'lib';

use TestMe ':ALL';

TODO: {
    local $TODO = 'Figure out how to avoid random order'; 
    my @have = unique( 2, 3, 5, 4, 3, 5, 7 );
    my @want = ( 2, 3, 5, 4, 7 );
    is_deeply \@have, \@want, 'unique() should return unique() elements in order';
}

throws_ok { reciprocal(0) } qr{Illegal division by zero at t/testit.t},
    'reciprocal(0) should report an error from the caller';

my %have = (
    numbers => [ 3, 4 ],
    fields  => { this => 'that', big => 'bad' },
    extra   => [ 3, 4 ],
);
my %want = (
    numbers => [ 3, 4 ],
    fields  => { this => 'taht', big => 'bad' },
    extra   => [ 4, 4 ],
);
eq_or_diff \%have, \%want, 'have and want should be the same';

ok reciprocal(2), 'The reciprocal of 2 should be true';
is reciprocal(2), .5, "The reciprocal of 2 should be correct";
like order_date(), qr{^\d\d/\d\d/\d\d\d\d$}x, 'order_date() should return a DD/MM/YYYY format';
is_deeply [3, 4], [3, 4], 'Identical array refs should match';

done_testing;

