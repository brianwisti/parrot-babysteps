use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

chdir 'code';
my @command = qw(parrot example-06-05.pir);

my $in;

# There are spaces after those colons!
my $expected =<<EXPECTED
StarID: 0
HIP: 
HD: 
HR: 
Gliese: 
BayerFlamsteed: 
ProperName: Sol
RA: 0
Dec: 0
Distance: 0.000004848
PMRA: 0
PMDec: 0
RV: 0
Mag: -26.73
AbsMag: 4.85
Spectrum: G2V
ColorIndex: 0.656
X: 0
Y: 0
Z: 0
VX: 0
VY: 0
VZ: 0
EXPECTED
;

run_output_is $expected, \@command, $in;

