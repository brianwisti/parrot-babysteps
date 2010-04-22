use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-02-11.pir);

my $in;

my $expected =<<EXPECTED
Question:\tAren't you sick of "Hello World"?
EXPECTED
;

run_output_is $expected, \@command, $in;
