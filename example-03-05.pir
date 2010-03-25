# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .local int    a
    .local int    b
    .local pmc    stdin

    stdin = getstdin

    a = stdin.'readline_interactive'('a: ')
    b = stdin.'readline_interactive'('b: ')

    if a > b goto A_IS_GREATER
    if b > a goto B_IS_GREATER
    goto BOTH_EQUAL

A_IS_GREATER:
    say "a is greater"
    goto END
B_IS_GREATER:
    say "b is greater"
    goto END
BOTH_EQUAL:
    say "a and b are the same"
    goto END

END:
    say "Wasn't that fun?"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

