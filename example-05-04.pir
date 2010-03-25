# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
	.const string PROMPT      = 'Enter a number (or "quit" to quit): '
	.const string EXIT_STRING = 'quit'
	.local string user_input
	.local num    latest_number
	.local num    total
	.local int    number_count
	.local pmc    numbers
	.local num    average
	.local pmc    stdin

	stdin = getstdin
	numbers = new 'ResizableFloatArray'

  GET_INPUT:
	user_input = stdin.'readline_interactive'(PROMPT)
	if user_input == EXIT_STRING goto SETUP_CALCULATE_SUM
	latest_number = user_input
	unshift numbers, latest_number
	goto GET_INPUT

  SETUP_CALCULATE_SUM:
	total = 0
	number_count = 0

  CALCULATE_SUM:
	latest_number = shift numbers
	total += latest_number
	number_count += 1
	if numbers goto CALCULATE_SUM

	average = total / number_count
	say average

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

