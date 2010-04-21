use Modern::Perl;
use Test::More tests => 1;

is "Hello, world!\n", `parrot example-01-01.pir`;
