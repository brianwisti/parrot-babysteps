use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my (@command, $in, $expected);

chdir 'code';

@command = qw(parrot example-0b-04.pir);

$expected =<<EXPECTED
Eggs cooked over easy
too few positional arguments: 1 passed, 2 (or more) expected
current instr.: 'breakfast' pc 34 (example-0b-04.pir:19)
called from Sub 'main' pc 26 (example-0b-04.pir:15)
EXPECTED
;

run_output_is $expected, \@command, $in;
