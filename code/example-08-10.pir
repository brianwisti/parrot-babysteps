# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .include 'test_more.pir'

    .local string provided_ssn
    .local string stored_ssn

    provided_ssn = '5551234567'

    plan(1)

    # Okay, let's pretend we got this result via user registration
    stored_ssn = provided_ssn
    isnt(provided_ssn, stored_ssn, 'SSN should not be stored as-is')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

