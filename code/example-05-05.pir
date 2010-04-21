# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
	.const string PROMPT      = 'Enter a number (or "quit" to quit): '
	.const string EXIT_STRING = 'quit'
	.local pmc    stdin
	.local string user_input
	.local num    latest_number
    .local pmc    stack
    .local int    stack_count
    .local num    stack_popped
    .local num    stack_sum
    .local num    stack_average
    .local pmc    queue
    .local int    queue_count
    .local num    queue_dequeued
    .local num    queue_sum
    .local num    queue_average

	stdin = getstdin
    stack = new 'ResizableFloatArray'
    queue = new 'ResizableFloatArray'

  GET_INPUT:
	user_input = stdin.'readline_interactive'(PROMPT)
    if user_input == EXIT_STRING goto SETUP_SUM_CALCULATIONS
	latest_number = user_input
    push stack, latest_number  # Push onto the stack
    push queue, latest_number  # Enqueue onto the queue
	goto GET_INPUT

  SETUP_SUM_CALCULATIONS:
    stack_count = 0
    stack_sum   = 0
    queue_count = 0
    queue_sum   = 0

  CALCULATE_STACK_SUM:
    stack_popped = pop stack
    print "Popped: "
    say stack_popped
    stack_sum += stack_popped
    stack_count += 1
    if stack goto CALCULATE_STACK_SUM

  CALCULATE_QUEUE_SUM:
    queue_dequeued = shift queue
    print "Dequeued: "
    say queue_dequeued
    queue_sum += queue_dequeued
    queue_count += 1
    if queue goto CALCULATE_QUEUE_SUM

    stack_average = stack_sum / stack_count
    queue_average = queue_sum / queue_count
    print "Stack average: "
    say stack_average
    print "Queue average: "
    say queue_average

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

