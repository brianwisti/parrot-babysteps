use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-02-04.pir);

my $in;

my $expected =<<EXPECTED
4 bytes in an integer on this machine
EXPECTED
;

run_output_is $expected, \@command, $in;
