use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 3;

my @command = qw(parrot code/example-03-05.pir);

my $in =<<IN
5
10
IN
;

my $expected =<<EXPECTED
a: 5
b: 10
b is greater
Wasn't that fun?
EXPECTED
;

run_output_is $expected, \@command, $in;

$in =<<IN
10
5
IN
;

$expected =<<EXPECTED
a: 10
b: 5
a is greater
Wasn't that fun?
EXPECTED
;

run_output_is $expected, \@command, $in;

$in =<<IN
10
10
IN
;

$expected =<<EXPECTED
a: 10
b: 10
a and b are the same
Wasn't that fun?
EXPECTED
;

run_output_is $expected, \@command, $in;
