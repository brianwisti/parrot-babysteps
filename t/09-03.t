use Modern::Perl;
use Test::CLI qw(run_output_is run_output_like);
use Test::More tests => 1;

my (@command, $in, $expected);

# No interaction in these tests, so $in won't get set.

chdir 'code/example-09-03';

@command = qw(parrot setup.pir test);

$expected = qr{All tests successful.}ms;

run_output_like $expected, \@command, $in;

