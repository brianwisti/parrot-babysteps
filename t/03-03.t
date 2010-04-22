use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-03-03.pir);

my $in =<<IN
Brian
IN
;

my $expected =<<EXPECTED
What is your name? Brian
Hello, Brian
EXPECTED
;

SKIP: {
    skip "I don't know how to catch timeouts yet", 1;
    run_output_is $expected, \@command, $in;
}
