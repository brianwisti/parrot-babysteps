use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my (@command, $in, $expected);

chdir 'code/example-0d-05';

@command = qw(parrot t/01-shell-metacommands.t);

$expected =<<'EXPECTED'
1..6
ok 1 - :help should be a registered default command
ok 2 - :quit should be a registered default command that returns an empty string
ok 3 - :help should reflect registered commands
ok 4 - User command ":dude" should result in string "Dude!"
ok 5 - Shell should warn about unknown commands
ok 6 - Shell should warn about invalid commands
EXPECTED
;

run_output_is $expected, \@command, $in;
