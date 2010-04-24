use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 2;

my @command = qw(parrot code/example-08-06.pir);

my $in;

my $expected =<<EXPECTED
1..1
ok 1 - Cache files should be cleaned up
EXPECTED
;

run_output_is $expected, \@command, $in;

`touch subpages.data`;

$expected =<<EXPECTED
1..1
not ok 1 - Cache files should be cleaned up
EXPECTED
;

run_output_is $expected, \@command, $in;

unlink 'subpages.data';
