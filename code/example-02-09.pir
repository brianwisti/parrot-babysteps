# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .local num a
    .local num b
    .local num c
    .local num a_squared
    .local num b_squared
    .local num c_squared
    .local pmc stdin

    stdin = getstdin
    a = stdin.'readline_interactive'('A: ')
    b = stdin.'readline_interactive'('B: ')
    a_squared = a * a
    b_squared = b * b
    c_squared = a_squared + b_squared
    c = sqrt c_squared
    print "Hypotenuse: "
    say c
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

