use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-08-09.pir);

my $in;

my $expected =<<EXPECTED
1..1
ok 1 - SSN should not be stored as-is
EXPECTED
;

run_output_is $expected, \@command, $in;
