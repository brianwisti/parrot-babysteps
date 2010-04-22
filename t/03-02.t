use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-03-02.pir);

my $in =<<IN
Brian
IN
;

my $expected =<<EXPECTED
What is your name? Brian
Hello, Brian
EXPECTED
;

run_output_is $expected, \@command, $in;