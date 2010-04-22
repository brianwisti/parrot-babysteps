use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-02-02.pir);

my $in; # non-interactive

my $expected =<<EXPECTED
2010
EXPECTED
;

run_output_is $expected, \@command, $in;
