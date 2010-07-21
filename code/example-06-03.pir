# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.loadlib 'io_ops'

.sub 'main' :main
    .const string DELIMITER  = ','
    .const string NAME_FIELD = 'ProperName'
    .local string filename
    .local pmc    data_file
    .local string current_line
    .local pmc    field_names
    .local int    field_count
    .local string current_field
    .local int    name_index
    .local pmc    star_data
    .local string star_name
    .local int    star_count
    .local int    named_count
    .local int    unnamed_count

    filename      = 'hygxyz.csv'
    name_index    = 0
    star_count    = 0
    named_count   = 0
    unnamed_count = 0
    data_file     = open filename, 'r'
    current_line  = readline data_file
    field_names   = split DELIMITER, current_line
    field_count   = field_names

  FIND_NAME_INDEX:
    if name_index >= field_count goto NAME_INDEX_ERROR
    current_field = field_names[name_index]
    if current_field == NAME_FIELD goto NEXT_STAR
    name_index += 1
    goto FIND_NAME_INDEX

  NAME_INDEX_ERROR:
    say 'Went through available fields without finding name index!'
    goto END

  NEXT_STAR:
    unless data_file goto SHOW_STAR_COUNT
    current_line = readline data_file
    star_count += 1
    star_data = split DELIMITER, current_line
    star_name = star_data[name_index]
    if star_name goto COUNT_NAMED_STAR
    unnamed_count += 1
    goto NEXT_STAR

  COUNT_NAMED_STAR:
    named_count += 1
    goto NEXT_STAR

  SHOW_STAR_COUNT:
    close data_file
    print 'There are '
    print star_count
    say ' stars in the HYG catalog.'
    print named_count
    say ' of them have proper names.'
    print unnamed_count
    say ' of them do not have proper names.'
    goto END

  END:


.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

