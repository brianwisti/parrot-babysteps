# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .const num PI = 3.1415926
    .const string PROMPT = "Radius: "

    .local num radius
    .local num area
    .local pmc stdin

    stdin = getstdin
    radius = stdin.'readline_interactive'(PROMPT)
    area = PI
    area *= radius
    area *= radius
    print "Area: "
    say area
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

