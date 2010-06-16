.include 'lib/stellar.pir'

.sub 'main' :main
    .include 'test_more.pir'
    .local string header_string
    .local string star_string
    .local string delimiter
    .local pmc    header_fields
    .local pmc    star

    star_string = "0,,,,,,Sol,0,0,0.000004848,0,0,0,-26.73,4.85,G2V,0.656,0,0,0,0,0,0"
    star = extract_from_csv_line(star_string)

    plan(8)

    $I0 = check_star_proper_name(star, 'Sol')
    ok($I0, 'Sol should have ProperName of "Sol"')
    $I0 = check_star_proper_name(star, 'Arcturus')
    nok($I0, 'Sol should not have ProperName of "Arcturus"')
    $I0 = check_star_spectrum(star, 'G2V')
    ok($I0, 'Sol should have Spectrum of "G2V"')
    $I0 = check_star_spectrum(star, 'K3V')
    nok($I0, 'Sol should not have Spectrum of "K3V"')

    $I0 = check_star_field(star, 'ProperName', 'Sol')
    ok($I0, 'Sol should have ProperName of "Sol"')
    $I0 = check_star_field(star, 'ProperName', 'Arcturus')
    nok($I0, 'Sol should not have ProperName of "Arcturus"')
    $I0 = check_star_field(star, 'Spectrum', 'G2V')
    ok($I0, 'Sol should have Spectrum of "G2V"')
    $I0 = check_star_field(star, 'Spectrum', 'K3V')
    nok($I0, 'Sol should not have Spectrum of "K3V"')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
