use Modern::Perl;
use Test::CLI qw(run_output_like);
use Test::More tests => 1;

my @command = qw(parrot code/example-08-11.pir);

my $in;

my $expected = qr{1..1
not ok 1 - Super Man is not Super Woman
# Have: Hash\[0x[^\]]+]
# Want: Hash\[0x[^\]]+]
}m;

run_output_like $expected, \@command, $in;
