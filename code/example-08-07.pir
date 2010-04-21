# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .include 'test_more.pir'

    .local string expected_title
    .local string actual_title

    expected_title = '08 - Test::More and Tapir'

    plan(1)

    # Okay, let's pretend we got this result by running the builder.
    actual_title = '08 - Test::More and Tapir'
    is(actual_title, expected_title, 'The title should be correct.')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

