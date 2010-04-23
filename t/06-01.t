use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

chdir 'code';
my @command = qw(parrot example-06-01.pir);

my $in;

my $expected =<<EXPECTED
There are 119618 stars in the HYG catalog.
EXPECTED
;

run_output_is $expected, \@command, $in;

