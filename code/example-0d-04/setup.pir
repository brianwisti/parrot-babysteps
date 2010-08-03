# Copyright (C) 2010 Parrot Foundation.
# $Id: $

.sub 'main' :main
    .param pmc args
    $S0 = shift args # Ignore my own filename
    load_bytecode 'distutils.pbc'

    # find out what command the user has issued.
    .local string directive
    directive = shift args

    # Used by test mode
    .local string prove_exec
    prove_exec = get_parrot()

    .tailcall setup(directive, 'prove_exec' => prove_exec)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

