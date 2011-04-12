# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub extract_star_details
    .param pmc    headers
    .param pmc    values

    .local pmc    star
    .local int    header_count
    .local string current_header
    .local string current_value
    .local int    current_index

    current_index = 0
    header_count = headers
    star = new 'Hash'

  ASSIGN_NEXT_STAR_FIELD:
    if current_index >= header_count goto RETURN_STAR
    current_header = headers[current_index]
    current_value = values[current_index]
    star[current_header] = current_value
    current_index += 1
    goto ASSIGN_NEXT_STAR_FIELD


  RETURN_STAR:
    .return(star)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

