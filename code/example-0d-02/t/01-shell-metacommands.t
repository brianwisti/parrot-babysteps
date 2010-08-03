# Copyright (C) 2010 Parrot Foundation.
# $Id: $


.include 'lib/spacetrade.pir'

.sub 'main' :main
    .include 'test_more.pir'

    plan(1)

    .local pmc    commands
    .local string expected
    .local string output

    commands = new 'Hash'
    commands = register_command(commands, ':dude', 'say_dude', 'Say "Dude!"')
    expected = "Dude!"
    output = evaluate_command(commands, ':dude')
    is(output, expected, 'User command ":dude" should result in string "Dude!"')
.end

.sub say_dude
    .return("Dude!")
.end
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

