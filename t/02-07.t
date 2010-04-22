use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-02-07.pir);

my $in;

my $expected =<<EXPECTED
Radius is 10
Area is 314.159
EXPECTED
;

run_output_is $expected, \@command, $in;
