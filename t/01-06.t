use Modern::Perl;
use IO::Pty::Easy;
use Test::More tests => 3;

my $pty = IO::Pty::Easy->new;
ok $pty->spawn("parrot", "code/example-01-06.pir");

my $output = $pty->read();
is $output, "Please enter your name: ";

$pty->write("Brian\n");
$output = $pty->read();
is $output, "Hello, Brian!\n";

$pty->close;
