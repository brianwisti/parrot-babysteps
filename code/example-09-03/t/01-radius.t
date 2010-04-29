# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.include 'lib/area.pir'

.sub 'main' :main
    .include 'test_more.pir'
    .local num radius
    .local num expected_area, actual_area

    plan(1)

    radius = 1.0
    expected_area = 3.1415926
    actual_area = area_of_circle(radius)
    is(expected_area, actual_area, 'Circle with radius 1 should have area PI', 1e-6)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

