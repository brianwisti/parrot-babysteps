# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .include 'test_more.pir'

    .local int cache_file_exists

    plan(1)
    cache_file_exists = stat 'subpages.data', 0
    nok(cache_file_exists, 'Cache files should be cleaned up')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

