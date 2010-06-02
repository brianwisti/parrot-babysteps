use Modern::Perl;
use Test::CLI qw(run_output_is);
use Test::More tests => 1;

my (@command, $in, $expected);

# No interaction in these tests, so $in won't get set.

chdir 'code/example-0a-01';

@command = qw(parrot setup.pir test);

$expected =<<EXPECTED
t/01-extract-details.t ..                             t/01-extract-details.t .. Dubious, test returned 1
Failed 1/1 subtests 

Test Summary Report
-------------------
t/01-extract-details.t (Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: Unknown TAP token: "Could not find sub extract_star_details"
                Unknown TAP token: "current instr.: 'main' pc 53 (t/01-extract-details.t:20)"
                Bad plan.  You planned 1 tests but ran 0.
Files=1, Tests=0,  0.014 wallclock secs
Result: FAIL
test fails
current instr.: 'setup' pc 883 (runtime/parrot/library/distutils.pir:376)
called from Sub 'main' pc 29 (setup.pir:17)
EXPECTED
;

run_output_is $expected, \@command, $in;
