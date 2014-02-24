package My::CustomTypes;

use Moose::Util::TypeConstraints;
use DateTime;

my %IS_ALLOWED_GENRE = map { $_ => 1 } qw(
    comedy
    drama
    documentary
    awesome
);

subtype 'Genre'
    => as 'Str',
    => where { my $gnr = uc $_; grep { uc $_ eq $gnr } qw(drama comedy documentary awesome) };


