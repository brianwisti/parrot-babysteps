# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .include 'test_more.pir'

    .local pmc expected_details
    .local pmc actual_details

    expected_details = new 'Hash'
    expected_details['first'] = 'Super'
    expected_details['last'] = 'Man'

    actual_details = new 'Hash'
    actual_details['first'] = 'Super'
    actual_details['last'] = 'Woman'

    plan(1)

    is_deeply(expected_details, actual_details, 'Super Man is not Super Woman')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

