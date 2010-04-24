use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-08-05.pir);

my $in;

my $expected =<<EXPECTED
1..2
ok 1 - `ok` tests for simple truth
not ok 2 - 0 is false, so this should fail.
EXPECTED
;

run_output_is $expected, \@command, $in;

