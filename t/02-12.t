use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-02-12.pir);

my $in =<<IN
BRian
IN
;

my $expected =<<EXPECTED
Enter some text: BRian
Number of characters: 5
Uppercase: BRIAN
Lowercase: brian
Title case: Brian
EXPECTED
;

run_output_is $expected, \@command, $in;
