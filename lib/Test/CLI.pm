package Test::CLI;
use strict;
use warnings;
use IPC::Run qw(run timeout);

use Test::More;
use base qw(Exporter);

our @EXPORT_OK = qw(
    run_output_is
    run_output_like
);

our $TIMEOUT = 10;

sub run_output_is {
    my ($expected, $command, $input, $diagnostic) = @_;
    my ($out_and_err);
    run $command, \$input, '>&', \$out_and_err, timeout($TIMEOUT);
    is $out_and_err, $expected, $diagnostic;
}

sub run_output_like {
    my ($expected, $command, $input, $diagnostic) = @_;
    my ($out_and_err);
    run $command, \$input, '>&', \$out_and_err, timeout($TIMEOUT);
    like $out_and_err, $expected, $diagnostic;
}

1;
