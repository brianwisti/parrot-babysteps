# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.loadlib 'io_ops'

.sub 'main' :main

    load_bytecode 'String/Utils.pbc'

    .const string DELIMITER  = ','
    .local pmc    chomp
    .local string filename
    .local pmc    data_file
    .local string current_line
    .local pmc    field_names
    .local int    field_count
    .local int    current_field_index
    .local string current_field_name
    .local string current_field_value
    .local pmc    star_data

    chomp         = get_global ['String';'Utils'], 'chomp'
    filename      = 'hygxyz.csv'
    data_file     = open filename, 'r'
    current_line  = readline data_file
    current_line  = chomp(current_line)
    field_names   = split DELIMITER, current_line
    field_count   = field_names

    current_line = readline data_file
    current_line = chomp(current_line)
    star_data = split DELIMITER, current_line
    close data_file
    current_field_index = 0

  DISPLAY_NEXT_FIELD:
    if current_field_index >= field_count goto END
    current_field_name = field_names[current_field_index]
    current_field_value = star_data[current_field_index]
    print current_field_name
    print ': '
    say current_field_value
    current_field_index += 1
    goto DISPLAY_NEXT_FIELD

  END:

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

