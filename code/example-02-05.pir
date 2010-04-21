# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    $I0 = 10   # decimal (base 10)
    say $I0
    $I0 = 0o10 # octal (base 8)
    say $I0
    $I0 = 0x10 # hexadecimal (base 16)
    say $I0
    $I0 = 0b10 # binary (base 2)
    say $I0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

