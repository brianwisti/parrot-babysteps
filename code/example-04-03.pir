# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .param pmc argv
    .local int argument_count
    .local string this_argument
    .local string description

  GET_ARG:
    argument_count = elements argv
    if argument_count <= 0 goto END
    this_argument = shift argv
    description = "This argument: " . this_argument
    say description
    goto GET_ARG

  END:

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

