use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 2;

my (@command, $in, $expected);

# No interaction in these tests, so $in won't get set.

chdir 'code/example-09-01';

@command = qw(parrot setup.pir help);

$expected =<<EXPECTED
usage: parrot setup.pir [target|--key value]*

    Default targets are :

        build:          Build the library.

        test:           Run the test suite.

        install:        Install the library.

        uninstall:      Uninstall the library.

        clean:          Basic cleaning up.

        update:         Update from the repository.

        plumage:        Output a skeleton for Plumage

        sdist:          Create a source distribution

        bdist:          Create a binary distribution

        help:           Print this help message.

EXPECTED
;

run_output_is $expected, \@command, $in;

@command = qw(parrot setup.pir test);
$expected =<<EXPECTED
Files=0, Tests=0,  0.000 wallclock secs
Result: NOTESTS
EXPECTED
;

run_output_is $expected, \@command, $in;
