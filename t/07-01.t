use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

chdir 'code';
my @command = qw(parrot example-07-01.pir);

my $in;

# There are spaces after those colons!
my $expected =<<EXPECTED
<Name: Sol, Spectrum: G2V, Distance: 0.000004848>
<Name: Rigel Kentaurus A, Spectrum: G2V, Distance: 1.34749097181049>
568 stars exactly matched Sol's spectrum G2V
567 have no proper name
EXPECTED
;

run_output_is $expected, \@command, $in;

