use Modern::Perl;
use Test::CLI qw(run_output_is run_output_like);
use Test::More tests => 1;

my (@command, $in, $expected);

# No interaction in these tests, so $in won't get set.

chdir 'code/example-09-02';

@command = qw(parrot setup.pir test);

$expected = qr{t/01-radius\.t \.\. Dubious, test returned 1}ms;

run_output_like $expected, \@command, $in;

