# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .param pmc args
    $S0 = shift args # Ignore my own filename
    load_bytecode 'distutils.pbc'

    # Find out what command the user has issued
    .local string directive
    directive = shift args

    setup(directive)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

