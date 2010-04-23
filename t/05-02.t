use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-05-02.pir);

my $in =<<IN
5
10
15
20
quit
IN
;

my $expected =<<EXPECTED
Enter a number (or "quit" to quit): 5
Enter a number (or "quit" to quit): 10
Enter a number (or "quit" to quit): 15
Enter a number (or "quit" to quit): 20
Enter a number (or "quit" to quit): quit
12.5
EXPECTED
;

run_output_is $expected, \@command, $in;

