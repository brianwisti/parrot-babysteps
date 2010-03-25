# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .param pmc argv
    .local int argument_count
    .local string program_name
    .local num a
    .local num b
    .local num c
    .local num a_squared
    .local num b_squared
    .local num c_squared
    .local string error_message

    program_name = shift argv
    argument_count = elements argv
    if argument_count != 2 goto BAD_ARG_COUNT
    a = shift argv
    b = shift argv
    a_squared = a ** 2
    b_squared = b ** 2
    say a_squared
    say b_squared
    c_squared = a_squared + b_squared
    c = sqrt c_squared
    say c
    goto END

  BAD_ARG_COUNT:
    error_message = "Exactly two arguments required"
    say error_message
    goto END

  END:
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

