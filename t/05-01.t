use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-05-01.pir);

my $in =<<IN
23
12
q
quit
IN
;

my $expected =<<EXPECTED
Enter a number (or "quit" to quit): 23
23
Enter a number (or "quit" to quit): 12
12
Enter a number (or "quit" to quit): q
0
Enter a number (or "quit" to quit): quit
Average goes here
EXPECTED
;

run_output_is $expected, \@command, $in;

