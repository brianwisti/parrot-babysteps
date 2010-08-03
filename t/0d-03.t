use Modern::Perl;
use Test::CLI qw(run_output_like);
use Test::More tests => 1;

my (@command, $in, $expected);

chdir 'code/example-0d-03';

@command = qw(parrot setup.pir test);

$expected = qr{Result: PASS};
run_output_like $expected, \@command, $in;
