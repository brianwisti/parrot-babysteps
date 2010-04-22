use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-02-05.pir);

my $in;

my $expected =<<EXPECTED
10
8
16
2
EXPECTED
;

run_output_is $expected, \@command, $in;
