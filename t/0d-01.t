use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my (@command, $in, $expected);

chdir 'code/example-0d-01';

@command = qw(parrot lib/spacetrade.pir);

$in =<<"INPUT"
waffles!
:help
:quit
INPUT
;

$expected =<<EXPECTED
Welcome to SpaceTrade!
Type ':help' for help, and ':quit' to quit.
> waffles!
Unknown command: waffles!
Type ':help' for help, and ':quit' to quit.
> :help
COMMANDS
:help    This view
:quit    Exit the shell
> :quit
Goodbye!
EXPECTED
;

run_output_is $expected, \@command, $in;
