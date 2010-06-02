.include 'lib/stellar.pir'

.sub 'main' :main
    .include 'test_more.pir'
    .local string header_string
    .local string sol_string
    .local string delimiter
    .local pmc    header_fields
    .local pmc    star_fields
    .local pmc    star

    header_string = "StarID,HIP,HD,HR,Gliese,BayerFlamsteed,ProperName,RA,Dec,Distance,PMRA,PMDec,RV,Mag,AbsMag,Spectrum,ColorIndex,X,Y,Z,VX,VY,VZ"
    sol_string = "0,,,,,,Sol,0,0,0.000004848,0,0,0,-26.73,4.85,G2V,0.656,0,0,0,0,0,0"
    delimiter = ","

    plan(1)

    header_fields = split delimiter, header_string
    star_fields = split delimiter, sol_string
    star = extract_star_details(header_fields, star_fields)

    $S0 = star['Proper Name']
    is($S0, 'Sol', 'ProperName should be Sol')

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
