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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

