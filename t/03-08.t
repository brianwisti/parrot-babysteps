use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 2;

my @command = qw(parrot code/example-03-08.pir);

my $in =<<IN
Brian
IN
;

my $expected =<<EXPECTED
What is your name? Brian
Hey, Brian!
EXPECTED
;

run_output_is $expected, \@command, $in;

$in =<<IN
Norm
IN
;

$expected =<<EXPECTED
What is your name? Norm
Hello, Norm
EXPECTED
;

run_output_is $expected, \@command, $in;
