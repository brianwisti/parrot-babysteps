use Modern::Perl;
use Test::CLI qw(run_output_like);
use Test::More tests => 1;

my @command = qw(parrot code/example-02-04.pir);

my $in;

my $expected = qr{\d bytes in an integer on this machine};
run_output_like $expected, \@command, $in;
