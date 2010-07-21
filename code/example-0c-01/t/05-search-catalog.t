.include 'lib/stellar.pir'

.sub 'main' :main
    .include 'test_more.pir'

    plan(5)

    .local string csv_filename 
    .local pmc    matches
    .local pmc    star
    
    csv_filename = 'data/test-catalog.csv'
    matches = search_catalog(csv_filename, 'ProperName', 'Sol')
    is(matches, 1, 'There should be one star named "Sol"')
    star = matches[0]
    $S0 = star['ProperName']
    is($S0, 'Sol', 'That star should be Sol')

    matches = search_catalog(csv_filename, 'Spectrum', 'G2V')
    is(matches, 2, 'There are two G2V stars in the test catalog')

    matches = search_catalog(csv_filename, 'Spectrum', 'K3V')
    is(matches, 1, 'There should be one K3V star in the test catalog')

    matches = search_catalog(csv_filename, 'Spectrum', 'G2V', 'ColorIndex', '0.566')
    is(matches, 1, 'There should be one G2V star with Spectrum G2V and ColorIndex 0.566')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
