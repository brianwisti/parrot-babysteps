use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-08-10.pir);

my $in;

my $expected =<<EXPECTED
1..1
not ok 1 - SSN should not be stored as-is
# Have: 5551234567
# Want: not 5551234567
EXPECTED
;

run_output_is $expected, \@command, $in;
