use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

chdir 'code';
my @command = qw(parrot example-08-01.pir);

my $in;

my $expected = '';

run_output_is $expected, \@command, $in;

