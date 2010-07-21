use Modern::Perl;
use Test::CLI qw(run_output_like);
use Test::More tests => 1;

my (@command, $in, $expected);

chdir 'code';

@command = qw(parrot example-0b-04.pir);

$expected = qr{too few positional arguments: 1 passed, 2 \(or more\) expected};

run_output_like $expected, \@command, $in;
