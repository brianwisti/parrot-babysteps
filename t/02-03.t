use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-02-03.pir);

my $in =<<IN
10
IN
;

my $expected =<<EXPECTED
Radius: 10
Area: 314.159
EXPECTED
;

run_output_is $expected, \@command, $in;
