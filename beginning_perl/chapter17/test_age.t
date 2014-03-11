
use strict;
use warnings;

use Test::More;
use Test::Exception;
use Capture::Tiny 'capture';

my $program = 'perl age.pl --birthdate 1964-10-18 --age_at 2007-10-02 Charles Stross';
my ($stdout, $stderr, @output) = capture { qx"$program" };
like "@output", qr/age is 42/, "Calculated age should be 42";

$program = 'perl age.pl --birthdate 1967-06-20';
($stdout, $stderr, @output) = capture { qx"$program" };
like "@output", qr/age is 46/, "Calculated age should be 46";


$program = 'perl age.pl Ovid';
($stdout, $stderr, @output) = capture { qx"$program" };
like $stderr, qr/DateTime object can  be subtracted from a DateTime object/, "Should throw error if birthdate is missing";

done_testing;

