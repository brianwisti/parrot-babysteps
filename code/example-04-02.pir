# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .param pmc argv
    .local int argument_count
    .local string description

    argument_count = elements argv
    description = "I was called with "
    $S0 = argument_count
    description .= $S0
    description .= " arguments"

    say description

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

