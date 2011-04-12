# Copyright (C) 2006-2009, Parrot Foundation.
# $Id: skeleton.pir 39953 2009-07-08 23:10:59Z chromatic $

.sub extract_from_csv_line
    .param string star_string
    .param pmc    header_fields
    .param string delimiter
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


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

