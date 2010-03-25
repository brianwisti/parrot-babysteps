# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    $S0 = 'Hello World!'
    $S1 = "Hello World!\n"
    $S2 =<<"EndS2"
Hello, World!
Isn't it a lovely day?
EndS2

    say $S0
    say $S1
    say $S2
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

