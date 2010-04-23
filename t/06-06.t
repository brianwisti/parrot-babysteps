use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

chdir 'code';
my @command = qw(parrot example-06-06.pir);

my $in;

# There are spaces after those colons!
my $expected =<<EXPECTED
<Name: Sol, Spectrum: G2V, Distance: 0.000004848>
EXPECTED
;

run_output_is $expected, \@command, $in;

