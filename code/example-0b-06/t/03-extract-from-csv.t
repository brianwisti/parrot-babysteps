.include 'lib/stellar.pir'

.sub 'main' :main
    .include 'test_more.pir'
    .local string header_string
    .local string star_string
    .local string delimiter
    .local pmc    header_fields
    .local pmc    star_fields
    .local pmc    star
    .local string summary

    header_string = "StarID,HIP,HD,HR,Gliese,BayerFlamsteed,ProperName,RA,Dec,Distance,PMRA,PMDec,RV,Mag,AbsMag,Spectrum,ColorIndex,X,Y,Z,VX,VY,VZ"
    delimiter = ","

    plan(5)

    header_fields = split delimiter, header_string

    summary = "<Name: Sol, Spectrum: G2V, Distance: 0.000004848>"
    star_string = "0,,,,,,Sol,0,0,0.000004848,0,0,0,-26.73,4.85,G2V,0.656,0,0,0,0,0,0"
    star = extract_from_csv_line(star_string, header_fields, delimiter)
    $S0 = summarize_star(star)
    is($S0, summary, "Sol's summary should include basic details")

    summary = "<Name: HD 224693, Spectrum: G2V, Distance: 94.0733772342427>"
    star_string = "117952,118319,224693,,,,,23.99826083,-22.42818030,94.0733772342427,148.74,27.53,,8.23,3.36266632261649,G2V,0.639,86.95751,-0.03959,-35.89135,4.82e-06,6.7829e-05,1.1605e-05"
    star = extract_from_csv_line(star_string, header_fields, delimiter)
    $S0 = summarize_star(star)
    is($S0, summary, "HD identifier can be used if ProperName is unavailable")

    summary = "<Name: HYG 117782, Spectrum: G2V, Distance: 139.275766016713>"
    star_string = "117782,118149,,,,,,23.96625102,15.95292997,139.275766016713,-46.50,-53.88,,9.59,3.8706222212115,G2V,0.648,133.90672,-1.18315,38.2796,9.72e-06,-3.1482e-05,-3.4977e-05"
    star = extract_from_csv_line(star_string, header_fields, delimiter)
    $S0 = summarize_star(star)
    is($S0, summary, "HYG identifier can be used if ProperName is unavailable")

    star = extract_from_csv_line(star_string, header_fields)
    $S0 = summarize_star(star)
    is($S0, summary, "delimiter should be optional")

    star = extract_from_csv_line(star_string)
    $S0 = summarize_star(star)
    is($S0, summary, "header_fields should be optional")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
