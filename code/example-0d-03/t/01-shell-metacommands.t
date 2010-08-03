# Copyright (C) 2010 Parrot Foundation.
# $Id: $


.include 'lib/spacetrade.pir'

.sub 'main' :main
    .include 'test_more.pir'

    plan(3)

    .local pmc    commands
    .local string expected
    .local string output

    commands = new 'Hash'
    commands = register_command(commands, ':dude', 'say_dude', 'Say "Dude!"')
    expected = "Dude!"
    output = evaluate_command(commands, ':dude')
    is(output, expected, 'User command ":dude" should result in string "Dude!"')

    expected = "Unknown command: :sweet"
    output = evaluate_command(commands, ':sweet')
    is(output, expected, 'Shell should warn about unknown commands')

    commands = register_command(commands, ':whats-mine-say', 'whats_mine_say', "What's mine say?")
    expected = "Invalid command: :whats-mine-say points to nonexistent sub whats_mine_say"
    output = evaluate_command(commands, ':whats-mine-say')
    is(output, expected, 'Shell should warn about invalid commands')
.end

.sub say_dude
    .return("Dude!")
.end
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

