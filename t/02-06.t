use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-02-06.pir);

my $in;

my $expected =<<EXPECTED
8 bytes in a number on this machine
EXPECTED
;

run_output_is $expected, \@command, $in;
