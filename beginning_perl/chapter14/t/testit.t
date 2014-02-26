use strict;
use warnings;

use Test::More;
use Test::Differences;
use Test::Exception;

use lib 'lib';

use TestMe ':ALL';

my @have = unique( 2, 3, 5, 4, 3, 5, 7 );
my @want = ( 2, 3, 5, 4, 7 );
is_deeply \@have, \@want, "unique() should return unique() elements in order";

@have = unique( 0, -1, 100, 2, -1, 3, 5, 0, 4, 3, 5, 7 );
@want = ( 0, -1, 100, 2, 3, 5, 4, 7 );
is_deeply \@have, \@want, "unique() should return unique() elements in order";

@have = unique_random( 5, 7, 8, 10, 5, 10, 20, 1, 72);
@want = ( 1, 72, 7, 5, 8, 10, 20);
is @have, @want, "unique_random() should return unique elements, order is not important";

throws_ok { reciprocal(0) } qr{Illegal division by zero at t/testit.t},
    'reciprocal(0) should report an error from the caller';

# Intentional FAIL to view diff table
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

