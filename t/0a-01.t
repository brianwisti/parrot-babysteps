use Modern::Perl;
use Test::CLI qw(run_output_like);
use Test::More;

my (@command, $in, $expected);

# No interaction in these tests, so $in won't get set.

chdir 'code/example-0a-01';

@command = qw(parrot setup.pir test);

$expected = qr{Could not find sub extract_star_details};
run_output_like $expected, \@command, $in;

done_testing();
