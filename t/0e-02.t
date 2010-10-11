use Modern::Perl;
use Test::CLI qw(run_output_like);
use Test::More tests => 1;

my (@command, $in, $expected);

chdir 'code/example-0e-02';

@command = qw(parrot setup.pir test);

$expected = qr{Could not find sub register_default_commands};
run_output_like $expected, \@command, $in;
