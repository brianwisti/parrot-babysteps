# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    $S0 = "Brian"
    $S1 = "Hello, " . $S0
    $S1 = $S1 . "!"
    say $S1
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

