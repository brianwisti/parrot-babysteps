# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
	.const string PROMPT      = 'Enter a number (or "quit" to quit): '
	.const string EXIT_STRING = 'quit'
	.local string user_input
	.local num    latest_number
	.local num    total
	.local int    numbers_entered
	.local num    average
	.local pmc    stdin

	stdin = getstdin
	total = 0
	numbers_entered = 0

  GET_INPUT:
	user_input = stdin.'readline_interactive'(PROMPT)
	if user_input == EXIT_STRING goto SHOW_AVERAGE
	latest_number = user_input
	numbers_entered += 1
	total += latest_number
	goto GET_INPUT

  SHOW_AVERAGE:
	average = total / numbers_entered
	say average
	goto EXIT

  EXIT:

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

