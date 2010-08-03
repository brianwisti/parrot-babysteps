use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my (@command, $in, $expected);

chdir 'code/example-0d-05';

@command = qw(parrot lib/spacetrade.pir);

$in =<<"INPUT"
:dude
:help
:quit
INPUT
;

$expected =<<EXPECTED
Welcome to SpaceTrade!
Type ':help' for help, and ':quit' to quit.
> :dude
Unknown command: :dude
> :help
COMMANDS
:help    This view
:quit    Exit the shell

> :quit
Goodbye!
EXPECTED
;

run_output_is $expected, \@command, $in;
