use Modern::Perl;
use Test::CLI qw(run_output_is run_output_like);
use Test::More tests => 1;

chdir 'code';
my @command = qw(parrot example-07-03.pir);

my $in;

# There are spaces after those colons!
my $expected = qr{
<Name: HYG 117782, Spectrum: G2V, Distance: 139.275766016713>
<Name: HD 224693, Spectrum: G2V, Distance: 94.0733772342427>
568 stars exactly matched Sol's spectrum G2V
\z}m;

run_output_like $expected, \@command, $in;

