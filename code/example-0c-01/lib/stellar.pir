# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub 'main' :main
.end

.sub extract_from_csv_line
    .param string star_string
    .param pmc    header_fields     :optional
    .param int    has_header_fields :opt_flag
    .param string delimiter         :optional
    .param int    has_delimiter     :opt_flag

    if has_delimiter goto CHECK_HEADER_FIELDS
    delimiter = ','
  CHECK_HEADER_FIELDS:
    if has_header_fields goto BEGIN_EXTRACTING
    .local string header_string
    header_string = "StarID,HIP,HD,HR,Gliese,BayerFlamsteed,ProperName,RA,Dec,Distance,PMRA,PMDec,RV,Mag,AbsMag,Spectrum,ColorIndex,X,Y,Z,VX,VY,VZ"
    header_fields = split delimiter, header_string

  BEGIN_EXTRACTING:
    .local pmc    star_fields
    .local pmc    star

    star_fields = split delimiter, star_string
    star = extract_star_details(header_fields, star_fields)

    .return(star)
.end

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

.sub summarize_star
    .param pmc star

    .local string star_name
    .local string star_spectrum
    .local string star_distance
    .local string summary

    star_name = star['ProperName']
    star_spectrum = star['Spectrum']
    star_distance = star['Distance']

    if star_name goto PREPARE_SUMMARY

  TRY_GLIESE:
    .local string gliese_number
    gliese_number = star['Gliese']
    unless gliese_number goto TRY_BAYER_FLAMSTEED
    star_name = 'Gliese ' . gliese_number
    goto PREPARE_SUMMARY

  TRY_BAYER_FLAMSTEED:
    .local string bayer_flamsteed
    bayer_flamsteed = star['BayerFlamsteed']
    unless bayer_flamsteed goto TRY_HR
    star_name = "BF " . bayer_flamsteed
    goto PREPARE_SUMMARY

  TRY_HR:
    .local string hr_id
    hr_id = star['HR']
    unless hr_id goto TRY_HD
    star_name = "HR " . hr_id
    goto PREPARE_SUMMARY

  TRY_HD:
    .local string hd_id
    hd_id = star['HD']
    unless hd_id goto USE_STAR_ID
    star_name = "HD " . hd_id
    goto PREPARE_SUMMARY

  TRY_HIP:
    .local string hip_id
    hip_id = star['HIP']
    unless hip_id goto USE_STAR_ID
    star_name = "HIP " . hip_id
    goto PREPARE_SUMMARY

  USE_STAR_ID:
    .local string star_id
    star_id = star['StarID']
    star_name = "HYG " . star_id
    goto PREPARE_SUMMARY

  PREPARE_SUMMARY:
    summary = "<Name: "
    summary .= star_name
    summary .= ", Spectrum: "
    summary .= star_spectrum
    summary .= ", Distance: "
    summary .= star_distance
    summary .= ">"

    .return(summary)
.end

.sub check_star
    .param pmc    star
    .param string field
    .param string desired_value
    .param pmc    extra_fields :slurpy
    .local int    match_result
    .local int    extra_field_count

    match_result = check_star_field(star, field, desired_value)

    # We're done if this match fails.
    unless match_result goto RETURN_RESULT

    extra_field_count = extra_fields
    # We're done if there are no extra fields.
    unless extra_field_count goto RETURN_RESULT

    # Grab the result of checking the extra fields.
    .tailcall check_star(star, extra_fields :flat)

  RETURN_RESULT:
    .return(match_result)
.end

.sub check_star_field
    .param pmc star
    .param string field
    .param string desired_value
    .local string actual_value
    .local int check_result

    actual_value = star[field]
    check_result = desired_value == actual_value
    .return(check_result)
.end

.sub search_catalog
    .param string filename
    .param pmc    conditions :slurpy
    .local pmc    chomp
    .local pmc    matches
    .local pmc    catalog
    .local string current_line
    .local pmc    current_star
    .local pmc    is_match

    load_bytecode 'String/Utils.pbc'
    chomp = get_global ['String';'Utils'], 'chomp'

    matches = new 'ResizablePMCArray'

    catalog = open filename, 'r'
    current_line = readline catalog # Ignore header line

  READ_LINE:
    unless catalog goto RETURN_MATCHES
    current_line = readline catalog
    current_line = chomp(current_line)
    current_star = extract_from_csv_line(current_line)
    is_match = check_star(current_star, conditions :flat)
    if is_match goto REMEMBER_MATCH
    goto READ_LINE

  REMEMBER_MATCH:
    push matches, current_star
    goto READ_LINE

  RETURN_MATCHES:
    close catalog
    .return(matches)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

