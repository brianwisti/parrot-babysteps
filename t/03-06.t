use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 2;

my @command = qw(parrot code/example-03-06.pir);

my $in =<<IN
990
IN
;

my $expected =<<EXPECTED
Enter a number (10 - 100): 990
That is not in the acceptable range!
Thank you!
EXPECTED
;

run_output_is $expected, \@command, $in;

$in =<<IN
82
IN
;

$expected =<<EXPECTED
Enter a number (10 - 100): 82
That is in the acceptable range.
Thank you!
EXPECTED
;

run_output_is $expected, \@command, $in;
