use Modern::Perl;
use Test::CLI qw(run_output_is run_output_like);
use Test::More tests => 2;

my (@command, $in, $expected);

# No interaction in these tests, so $in won't get set.

chdir 'code/example-0a-02';

@command = qw(parrot setup.pir test);

$expected = qr{Failed test:  1}m;
run_output_like $expected, \@command, $in;

@command = qw(parrot t/01-extract-details.t);
$expected = qr{not ok 1 - ProperName should be Sol}m;
run_output_like $expected, \@command, $in;
