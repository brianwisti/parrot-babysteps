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
    .local pmc    star_data
    .local pmc    star
    .local string star_name
    .local string star_spectrum
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

    current_line = readline data_file
    current_line = chomp(current_line)
    star_data = split DELIMITER, current_line
    sol = extract_star_details(field_names, star_data)

  FIND_MATCHING_STARS:
    sol_spectrum = sol['Spectrum']
    matching_count = 0
    unnamed_match_count = 0
    # We want to show Sol's details as well as other matches.
    say_star_details(sol)

  LOAD_NEXT_STAR:
    unless data_file goto END
    current_line = readline data_file
    current_line = chomp(current_line)
    star_data    = split DELIMITER, current_line
    star         = extract_star_details(field_names, star_data)

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
    say_star_details(star)
    goto LOAD_NEXT_STAR

  END:
    close data_file
    print matching_count
    print " stars exactly matched Sol's spectrum "
    say sol_spectrum
    print unnamed_match_count
    say ' have no proper name'

.end

.sub extract_star_details
    .param pmc headers
    .param pmc values

    .local pmc star
    .local int header_count
    .local string current_header
    .local string current_value
    .local int current_index

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

.sub say_star_details
    .param pmc star

    .local string star_name
    .local string star_spectrum
    .local string star_distance

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
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

