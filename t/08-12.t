use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-08-12.pir);

my $in;

my $expected =<<EXPECTED
1..1
not ok 1 - Super Man is not Super Woman
# Mismatch at [last]: expected Man, received Woman
EXPECTED
;

run_output_is $expected, \@command, $in;
