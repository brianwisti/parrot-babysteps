# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $



.sub area_of_circle
    .param num radius
    .const num PI = 3.1415926
    .local num area

    area = PI
    area *= radius
    area *= radius

    .return(area)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

