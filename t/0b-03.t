use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my (@command, $in, $expected);

chdir 'code';

@command = qw(parrot example-0b-03.pir);

$expected =<<EXPECTED
Eggs cooked over easy topped with Frank's RedHot
Eggs cooked over easy
EXPECTED
;

run_output_is $expected, \@command, $in;
