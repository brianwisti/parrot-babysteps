# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    set $N0, 3.14159
    set $N1, 10

    print "Radius is "
    say $N1

    # Calculate the area
    set $N2, $N0
    mul $N2, $N1
    mul $N2, $N1
    print "Area is "
    say $N2
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

