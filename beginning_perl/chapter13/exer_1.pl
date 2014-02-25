#!/usr/bin/env perl 

use strict;
use warnings;

use lib 'lib';
use User;
use Data::Dumper;

my $user = User->new(
    username => 'Ovid',
    password => 'Corinna',
);

print $user->dump;
print "Yes" if $user->password_eq('Corinna');

print Dumper($user->to_hash);
