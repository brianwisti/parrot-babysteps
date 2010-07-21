# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.loadlib 'sys_ops'
.include 'sysinfo.pasm'

.sub 'main' :main
    $I0 = sysinfo .SYSINFO_PARROT_INTSIZE
    print $I0
    say " bytes in an integer on this machine"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

