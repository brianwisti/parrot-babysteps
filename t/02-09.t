use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-02-09.pir);

my $in =<<IN
1
1
IN
;

my $expected =<<EXPECTED
A: 1
B: 1
Hypotenuse: 1.4142135623731
EXPECTED
;

run_output_is $expected, \@command, $in;
