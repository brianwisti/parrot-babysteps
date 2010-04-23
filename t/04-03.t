use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

chdir 'code';
my @command = qw(parrot example-04-03.pir hey there);

my $in;
my $expected =<<EXPECTED
This argument: example-04-03.pir
This argument: hey
This argument: there
EXPECTED
;

run_output_is $expected, \@command, $in;

