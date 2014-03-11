#!/usr/bin/env perl 

use strict;
use warnings;

my $text = <<'END';
I will not be pushed, filed, stamped, indexed,
briefed, debriefed, or numbered.
END

open my $fh, '|-', 'wc' or die $!;
print $fh $text;

