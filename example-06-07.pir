# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

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
    .local pmc    star
    .local string star_name
    .local string star_spectrum
    .local string star_distance
    .local pmc    sol
    .local string sol_spectrum
    .local int    matching_count
    .local int    unnamed_match_count

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
    current_field_index = 0
    sol = new 'Hash'

  ASSIGN_NEXT_SOL_FIELD:
    if current_field_index >= field_count goto FIND_MATCHING_STARS
    current_field_name = field_names[current_field_index]
    current_field_value = star_data[current_field_index]
    sol[current_field_name] = current_field_value
    current_field_index += 1
    goto ASSIGN_NEXT_SOL_FIELD


  FIND_MATCHING_STARS:
    sol_spectrum = sol['Spectrum']
    matching_count = 0
    unnamed_match_count = 0
    # We want to show Sol's details as well as other matches.
    star = sol
    goto DISPLAY_STAR_DETAILS

  LOAD_NEXT_STAR:
    unless data_file goto END
    current_line = readline data_file
    current_line = chomp(current_line)
    star_data = split DELIMITER, current_line
    current_field_index = 0
    star = new 'Hash'

  ASSIGN_NEXT_STAR_FIELD:
    if current_field_index >= field_count goto EXAMINE_STAR
    current_field_name = field_names[current_field_index]
    current_field_value = star_data[current_field_index]
    star[current_field_name] = current_field_value
    current_field_index += 1
    goto ASSIGN_NEXT_STAR_FIELD

  EXAMINE_STAR:
    star_spectrum = star['Spectrum']
    if star_spectrum == sol_spectrum goto REMEMBER_MATCH
    goto LOAD_NEXT_STAR

  REMEMBER_MATCH:
    matching_count += 1
    star_name = star['ProperName']
    if star_name goto DISPLAY_STAR_DETAILS
    unnamed_match_count += 1
    goto LOAD_NEXT_STAR

  DISPLAY_STAR_DETAILS:
    star_name = star['ProperName']
    star_spectrum = star['Spectrum']
    star_distance = star['Distance']
    print "<Name: "
    print star_name
    print ", Spectrum: "
    print star_spectrum
    print ", Distance: "
    print star_distance
    say ">"
    goto LOAD_NEXT_STAR

  END:
    close data_file
    print matching_count
    print " stars exactly matched Sol's spectrum "
    say sol_spectrum
    print unnamed_match_count
    say ' have no proper name'

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

