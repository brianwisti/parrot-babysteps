use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my (@command, $in, $expected);

chdir 'code/example-0c-02';

@command = qw(parrot lib/stellar.pir Spectrum G2V ColorIndex 0.656);

$expected =<<EXPECTED
<Name: Sol, Spectrum: G2V, Distance: 0.000004848>
<Name: HD 7186, Spectrum: G2V, Distance: 112.359550561798>
<Name: HD 140235, Spectrum: G2V, Distance: 60.1684717208183>
<Name: HD 169019, Spectrum: G2V, Distance: 108.108108108108>
4 matches.
EXPECTED
;

run_output_is $expected, \@command, $in;
