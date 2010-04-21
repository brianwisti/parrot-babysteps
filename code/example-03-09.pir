# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .const int start = 10
    .const int stop  = 0
    .local int current

    current = start
  COUNTDOWN:
    if current < stop goto LIFTOFF
    say current
    current -= 1
    goto COUNTDOWN

  LIFTOFF:
    say "Liftoff!"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

