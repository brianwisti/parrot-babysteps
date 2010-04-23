use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my @command = qw(parrot code/example-04-04.pir 12 23);

my $in;

my $expected =<<EXPECTED
144
529
25.9422435421457
EXPECTED
;

run_output_is $expected, \@command, $in;

