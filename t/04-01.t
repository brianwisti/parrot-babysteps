use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-04-01.pir);

my $in;
my $expected = '';

run_output_is $expected, \@command, $in;

