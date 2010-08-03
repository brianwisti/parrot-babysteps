# Copyright (C) 2010 Parrot Foundation.
# $Id: $

.sub 'main' :main
    run_shell()
.end

.sub run_shell
    .local string input
    .local pmc    stdin
    .const string PROMPT     = '> '
    .const string QUICK_HELP = "Type ':help' for help, and ':quit' to quit."

    stdin = getstdin

    say "Welcome to SpaceTrade!"
    say QUICK_HELP

  READLINE:
    input = stdin.'readline_interactive'(PROMPT)
    if input == ':quit' goto EXIT
    if input == ':help' goto SHOW_USAGE
    goto SHOW_ERROR

  SHOW_USAGE:
    say "COMMANDS"
    say ":help    This view"
    say ":quit    Exit the shell"
    goto READLINE

  SHOW_ERROR:
    .local string error_message
    error_message = "Unknown command: "
    error_message .= input
    say error_message
    say QUICK_HELP
    goto READLINE

  EXIT:
    say "Goodbye!"
.end

.sub evaluate_command
    .param pmc    commands
    .param string name

    .local string sub_name
    .local pmc    command_sub
    .local string output

    sub_name = commands[name;'sub_name']
    unless sub_name goto UNKNOWN_COMMAND
    command_sub = get_global sub_name
    if_null command_sub, INVALID_COMMAND
    output = command_sub()
    goto RETURN_OUTPUT

  UNKNOWN_COMMAND:
    output = "Unknown command: " . name
    goto RETURN_OUTPUT

  INVALID_COMMAND:
    output = "Invalid command: " . name
    output .= " points to nonexistent sub "
    output .= sub_name

  RETURN_OUTPUT:
    .return(output)
.end

.sub register_command
    .param pmc    commands
    .param string name
    .param string sub_name
    .param string explanation

    .local pmc    command
    .local pmc    callback

    command = new 'Hash'
    command['sub_name'] = sub_name
    command['explanation'] = explanation
    commands[name] = command

  RETURN_COMMANDS:
    .return(commands)
.end

.sub register_default_commands
    .local pmc commands

    commands = new 'Hash'
    commands = register_command(commands, ':help', 'default_help', 'This view')
    commands = register_command(commands, ':quit', 'default_quit', 'Exit the shell')

    .return(commands)
.end

.sub default_help
    .local string output

    output =<<'OUTPUT'
COMMANDS
:help    This view
:quit    Exit the shell
OUTPUT

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

