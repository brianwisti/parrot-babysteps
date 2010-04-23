use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-04-02.pir hey there);

my $in;
my $expected =<<EXPECTED
I was called with 3 arguments
EXPECTED
;

run_output_is $expected, \@command, $in;

