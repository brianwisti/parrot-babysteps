# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .const string PROMPT = "What is your name? "
    .local string name
    .local string response
    .local pmc    stdin

    stdin = getstdin

    name = stdin.'readline_interactive'(PROMPT)
    if name == "Brian" goto GREETING_FOR_BRIAN
    response = "Hello, " . name
    goto SAY_IT

  GREETING_FOR_BRIAN:
    response = "Hey, Brian!"

  SAY_IT:
    say response
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

