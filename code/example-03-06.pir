# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .const int MINIMUM = 10
    .const int MAXIMUM = 100
    .local int input
    .local int input_is_valid
    .local pmc stdin

    stdin = getstdin

GET_NUMBER:
    print "Enter a number ("
    print MINIMUM
    print " - "
    print MAXIMUM
    print ")"
    input = stdin.'readline_interactive'(': ')
    $I0 = input >= MINIMUM
    $I1 = input <= MAXIMUM
    input_is_valid = and $I0, $I1
    if input_is_valid goto VALID_INPUT
    say "That is not in the acceptable range!"
    goto END_PROGRAM

  VALID_INPUT:
    say "That is in the acceptable range."

  END_PROGRAM:
    say "Thank you!"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

