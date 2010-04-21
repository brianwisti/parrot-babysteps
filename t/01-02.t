use Modern::Perl;
use Test::More tests => 1;

is "Hello, Brian!\n", `parrot example-01-02.pir`;
