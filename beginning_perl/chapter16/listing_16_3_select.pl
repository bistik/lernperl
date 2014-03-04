#!/usr/bin/env perl 

use strict;
use warnings;

use lib 'lib';
use MyDatabase 'db_handle';

my $dbh = db_handle('rights.db');
my $sth = $dbh->prepare(<<"SQL");
SELECT id, media_type
FROM media_types
ORDER BY id ASC
SQL
$sth->execute;

while ( my @row = $sth->fetchrow_array ) {
    print "$row[0] - $row[1]\n";
}
