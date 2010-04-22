use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-03-10.pir);

my $in = <<IN

Brian
IN
;

# There's a space after the question mark!
my $expected =<<EXPECTED
What is your name? 
What is your name? Brian
Hello, Brian
EXPECTED
;

run_output_is $expected, \@command, $in;

