use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-02-10.pir);

my $in;

my $expected =<<EXPECTED
Hello World!
Hello World!

Hello, World!
Isn't it a lovely day?

EXPECTED
;

run_output_is $expected, \@command, $in;
