use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-05-04.pir);

my $in =<<IN
1e+5
1e+3
1e+1
quit
IN
;

my $expected =<<EXPECTED
Enter a number (or "quit" to quit): 1e+5
Enter a number (or "quit" to quit): 1e+3
Enter a number (or "quit" to quit): 1e+1
Enter a number (or "quit" to quit): quit
33670
EXPECTED
;

run_output_is $expected, \@command, $in;

