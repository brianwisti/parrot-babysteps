# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .local string name
    .local string greeting
    .local pmc stdin

    stdin = getstdin
    name = stdin.'readline_interactive'("Please enter your name: ")
    greeting = "Hello, " . name
    greeting .= "!"
    say greeting
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

