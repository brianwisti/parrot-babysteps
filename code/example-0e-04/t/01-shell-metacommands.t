.include 'lib/spacetrade.pir'

.namespace [ ]

.sub 'main' :main
    .include 'test_more.pir'

    plan(6)

    .local pmc    register_default_commands
    .local pmc    evaluate_command
    .local pmc    register_command
    .local pmc    commands
    .local string expected
    .local string output

    register_default_commands = get_global ['SpaceTrade';'Shell'], 'register_default_commands'
    evaluate_command = get_global ['SpaceTrade';'Shell'], 'evaluate_command'
    register_command = get_global ['SpaceTrade';'Shell'], 'register_command'

    commands = register_default_commands()

    expected =<<'EXPECTED'
COMMANDS
:help    This view
:quit    Exit the shell
EXPECTED
    output = evaluate_command(commands, ':help')
    is(output, expected, ':help should be a registered default command')

    expected = ''
    output = evaluate_command(commands, ':quit')
    is(output, expected, ':quit should be a registered default command that returns an empty string')

    .local pmc my_sub
    my_sub = get_global 'say_dude'
    commands = register_command(commands, ':dude', my_sub, 'Say "Dude!"')

    expected =<<'EXPECTED'
COMMANDS
:dude    Say "Dude!"
:help    This view
:quit    Exit the shell
EXPECTED
    output = evaluate_command(commands, ':help')
    is(output, expected, ':help should reflect registered commands')

    expected = "Dude!"
    output = evaluate_command(commands, ':dude')
    is(output, expected, 'User command ":dude" should result in string "Dude!"')

    expected = "Unknown command: :sweet"
    output = evaluate_command(commands, ':sweet')
    is(output, expected, 'Shell should warn about unknown commands')

    commands = register_command(commands, ':whats-mine-say', 'whats_mine_say', "What's mine say?")
    expected = "Invalid command: :whats-mine-say does not point to a valid subroutine"
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

