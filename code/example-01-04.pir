# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .local string name
    .local string greeting

    name = "Brian"
    greeting = "Hello, " . name
    greeting = greeting . "!"
    say greeting
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

