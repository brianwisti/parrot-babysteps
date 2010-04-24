use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-08-08.pir);

my $in;

my $expected =<<EXPECTED
1..1
not ok 1 - The title should be correct.
# Have: I am a Walrus
# Want: 08 - Test::More and Tapir
EXPECTED
;

run_output_is $expected, \@command, $in;
