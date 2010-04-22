use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-03-09.pir);

my $in;

my $expected =<<EXPECTED
10
9
8
7
6
5
4
3
2
1
0
Liftoff!
EXPECTED
;

run_output_is $expected, \@command, $in;

