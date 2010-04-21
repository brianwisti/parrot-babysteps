# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .const num PI     = 3.14159
    .const num RADIUS = 10
    .local num area

    print "Radius: "
    say RADIUS

    # Area of a circle: PI * RADIUS * RADIUS
    area = PI
    area *= RADIUS
    area *= RADIUS
    print "Area: "
    say area
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

