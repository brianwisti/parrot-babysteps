.namespace ['SpaceTrade';'Shell']

.sub 'main' :main
    run_shell()
.end

.sub run_shell
    .local pmc    commands
    .local string input
    .local string output
    .local pmc    stdin
    .const string PROMPT     = '> '
    .const string QUICK_HELP = "Type ':help' for help, and ':quit' to quit."

    commands = register_default_commands()
    stdin = getstdin

    say "Welcome to SpaceTrade!"
    say QUICK_HELP

  READLINE:
    input = stdin.'readline_interactive'(PROMPT)
    output = evaluate_command(commands, input)
    unless output goto EXIT
    say output
    goto READLINE

  EXIT:
    say "Goodbye!"
.end

.sub evaluate_command
    .param pmc    commands
    .param string name

    .local int    has_command
    .local pmc    command_info
    .local pmc    code
    .local int    is_invokable
    .local pmc    command_sub
    .local string output

    has_command = exists commands[name]
    unless has_command goto UNKNOWN_COMMAND

    command_sub = commands[name;'code']
    if_null command_sub, INVALID_COMMAND

    is_invokable = does command_sub, 'invokable'
    unless is_invokable goto INVALID_COMMAND

    output = command_sub(commands)
    goto RETURN_OUTPUT

  UNKNOWN_COMMAND:
    output = "Unknown command: " . name
    goto RETURN_OUTPUT

  INVALID_COMMAND:
    output = "Invalid command: " . name
    output .= " does not point to a valid subroutine"

  RETURN_OUTPUT:
    .return(output)
.end

.sub register_command
    .param pmc    commands
    .param string name
    .param pmc    code
    .param string explanation

    .local pmc    command
    .local pmc    callback

    command = new 'Hash'
    command['code'] = code
    command['explanation'] = explanation

    commands[name] = command
    goto RETURN_COMMANDS

  RETURN_COMMANDS:
    .return(commands)
.end

.sub register_default_commands
    .local pmc commands
    .local pmc help_command
    .local pmc quit_command

    commands = new 'Hash'
    help_command = get_global 'default_help'
    quit_command = get_global 'default_quit'
    commands = register_command(commands, ':help', help_command, 'This view')
    commands = register_command(commands, ':quit', quit_command, 'Exit the shell')

    .return(commands)
.end

.sub default_help
    .param pmc    commands
    .local string output
    .local pmc    command_iter
    .local pmc    command_keys
    .local string key

    command_keys = new 'ResizablePMCArray'
    command_iter = iter commands

  NEXT_COMMAND:
    unless command_iter goto PREPARE_OUTPUT
    key = shift command_iter
    push command_keys, key
    goto NEXT_COMMAND

  PREPARE_OUTPUT:
    output = "COMMANDS\n"
    command_keys.'sort'()

    .local string command_name
    .local string command_explanation
    .local string command_summary
    command_iter = iter command_keys

  NEXT_SUMMARY:
    unless command_iter goto RETURN_OUTPUT
    command_name = shift command_iter
    command_explanation = commands[command_name;'explanation']
    command_summary = command_name . '    '
    command_summary .= command_explanation
    command_summary .= "\n"
    output .= command_summary
    goto NEXT_SUMMARY

  RETURN_OUTPUT:
    .return(output)
.end

.sub default_quit
    .local string output
    output = ''
    .return(output)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

