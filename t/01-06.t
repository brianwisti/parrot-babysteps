use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-01-06.pir);

my $in =<<INPUT
Brian
INPUT
;

my $expected =<<EXPECTED
Please enter your name: Brian
Hello, Brian!
EXPECTED
;

run_output_is $expected, \@command, $in;

