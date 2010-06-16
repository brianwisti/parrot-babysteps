# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $


.sub 'main' :main
    .local string eggs
    .local string topping 
    .local string order

    eggs = 'over easy'
    topping = "Frank's RedHot"

    order = breakfast(eggs, topping)
    say order

    order = breakfast(eggs)
    say order
.end

.sub breakfast
    .param string eggs
    .param string topping     :optional
    .param int    has_stuff :opt_flag

    .local string breakfast_order
    breakfast_order = 'Eggs cooked ' . eggs

    unless has_stuff goto SERVE_BREAKFAST
    breakfast_order .= ' topped with '
    breakfast_order .= topping

  SERVE_BREAKFAST:
    .return(breakfast_order)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

