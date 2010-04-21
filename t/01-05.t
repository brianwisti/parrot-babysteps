use Modern::Perl;
use Test::More tests => 1;

is "Hello, Brian!\n", `parrot code/example-01-05.pir`;
