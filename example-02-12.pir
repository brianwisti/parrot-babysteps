# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
    .const string PROMPT = "Enter some text: "
    .local string text
    .local int    text_length
    .local string transformed
    .local pmc    stdin

    stdin = getstdin
    text = stdin.'readline_interactive'(PROMPT)
    print "Number of characters: "
    text_length = length text
    say text_length
    print "Uppercase: "
    transformed = upcase text
    say transformed
    print "Lowercase: "
    transformed = downcase text
    say transformed
    print "Title case: "
    transformed = titlecase text
    say transformed
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

