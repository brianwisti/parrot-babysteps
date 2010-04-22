use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-02-01.pir);

my $in; # non-interactive

my $expected =<<EXPECTED
10
20
EXPECTED
;

run_output_is $expected, \@command, $in;
