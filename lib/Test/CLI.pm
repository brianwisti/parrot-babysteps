package Test::CLI;
use strict;
use warnings;
use IPC::Run qw(run timeout);
use Test::More;

use base qw(Exporter);

our @EXPORT_OK = qw(
    run_output_is
);

our $TIMEOUT = 10;

sub run_output_is {
    my ($expected, $command, $input, $diagnostic) = @_;
    my ($out, $err);
    run $command, \$input, \$out, \$err, timeout($TIMEOUT);
    is $out, $expected, $diagnostic;
}

1;
