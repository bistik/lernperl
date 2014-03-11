#!/usr/bin/env perl 

use strict;
use warnings;

my $text = <<'END';
I will not be pushed, filed, stamped, indexed,
briefed, debriefed, or numbered.
END

use Capture::Tiny 'capture';
my ($stdout, $stderr, @output) = capture {
    open my $fh, '|-', 'wc' or die $!;
    print $fh $text;
    close $fh or die "Cannot close piped open to wc: $!";
};
my ($lines, $words, $characters)
    = ( $stdout =~ /(\d+)\s+(\d+)\s+(\d+)/ );
print "Lines: $lines  Words: $words  Characters: $characters\n";
