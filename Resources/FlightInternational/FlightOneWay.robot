*** Settings ***
#Library                            SeleniumLibrary
Resource                            /Users/ranti/Documents/automation-web-RF/Frameworks/Routers.robot

*** Variables ***
${flightinter}                      css=#site-content > section.section-search > div > div > div > div > div.tab-list > ul > li:nth-child(5) > a
${pulang_pergi}                     css=#site-content > section.section-search > div > div > div > div > div.tab-content > div:nth-child(5) > div > div:nth-child(1) > div > div:nth-child(2) > label
${asal}                             id=input-origin-flight-international-airport
${list_asal}                        css=#site-content > section.section-search > div > div > div.col-12.search-box > div > div.tab-content > div:nth-child(5) > div > div.search-item.search.flight > div.d-flex > div:nth-child(1) > div.search-result-destination > div.search-wrap > div:nth-child(1)
${list_tujuan}                      css=#site-content > section.section-search > div > div > div.col-12.search-box > div > div.tab-content > div:nth-child(5) > div > div.search-item.search.flight > div.d-flex > div:nth-child(2) > div.search-result-destination > div.search-wrap > div:nth-child(1)
${tujuan}                           id=input-destination-flight-international-airport
${start_date}                       id=input-start-date-flight-international
${f_date}                           css=#site-content > section.section-search > div > div > div.col-12.search-box > div > div.tab-content > div:nth-child(5) > div > div.search-item.search.flight > div.datepicker > div:nth-child(1) > div.datepicker-wrapper > div.datepicker.vc-container.vc-reset.vc-text-gray-900.vc-bg-white.vc-border.vc-border-gray-400.vc-rounded-lg > div.vc-w-full.vc-relative > div.vc-grid-container.grid > div.vc-grid-cell.vc-grid-cell-row-1.vc-grid-cell-row--1.vc-grid-cell-col-2.vc-grid-cell-col--1 > div > div.vc-grid-container.vc-weeks > div:nth-child(23) > div > div > span
${end_date}                         id=input-end-date-flight-international
${passenger}                        id=input-passengers-flight-international
${class}                            id=vs2__combobox
${search}                           id=btn-search-flight-international
${confirm}                          css=#modalDetails6_1 > div > div > div.modal-footer.pd-20 > div > div.col-md-2.col-xs-12 > form > button
${phone}                            id=contactmobile_no
${same_data}                        css=#myform2 > div > div > div.col-md-8.col-xs-12.clean-gap.mgTopMob10px > div:nth-child(8) > div > div.col-md-12.hidden-xs > div > div > label
${field_nation}                     id=Nationality[1]
${select_nation}                    css=option[value="ID"]
${field_birthdate}                  id=Day[1]
${birthdate}                        css=option[value="11"]
${field_monthbith}                  id=Month[1]
${month}                            css=option[value="10"]
${field_yearbirth}                  id=Years[1]
${year}                             css=option[value="1999"]
${field_paspor}                     id=PPNumber[1]
${field_dateexp}                    id=PPDay[1]
${date_expired}                     css=option[value="12"]
${field_monthexp}                   id=PPMonth[1]
${month_expired}                    css=option[value="10"]
${field_yearexp}                    id=PPYear[1]
${year_expired}                     css=option[value="2026"]
${field_country}                    id=PPIssued[1]
${select_country}                   css=option[value="ID"]
${btn_confirm}                      css=#myform2 > div > div > div.col-md-8.col-xs-12.clean-gap.mgTopMob10px > div.col-md-2.col-md-offset-9.clean-gap-mob > button
${popup_confirm}                    css=#modalCheck > div > div > div
${btn_lanjut}                       css=#modalCheck > div > div > div > center > div.col-md-12.col-xs-12 > div:nth-child(2) > button
${detail_pemesan}                   css=body > div.section.order-detail > div > div.col-xs-12.clean-gap > h4 > b
${btn_bayar}                        css=body > div.section.order-detail > div > div.col-md-4.col-xs-12.clean-gap-mob > span.hidden-xs > div:nth-child(11) > a > button

${ok_popup}                         css=#modalCancelBooking > div > div > div > div > div:nth-child(4) > div > button
${text_pop}                         css=#errorModalCancel > b

#Expected
${expected_search}                  css=#oneWayFilter > div.searchResultParent > div > div:nth-child(1) > div > div.panel.panel-default.br-8 > div > div.col-md-2.col-xs-12 > div > button

*** Keywords ***
Search Flight One
   [Arguments]         ${DEPART}    ${DESTINATION}  ${EX_SEARCH}
    Wait Until Element Is Visible       ${flightinter}
    Click Element                       ${flightinter}
    Wait Until Element Is Visible       ${asal}
    Click Element                       ${asal}
    Input Text                          ${asal}             ${DEPART}
    Wait Until Element Is Visible       ${list_asal}
    Click Element                       ${list_asal}
    Click Element                       ${tujuan}
    Input Text                          ${tujuan}           ${DESTINATION}
    Wait Until Element Is Visible       ${list_tujuan}
    Click Element                       ${list_tujuan}
    Click Element                       ${start_date}
    Wait Until Element Is Visible       ${f_date}
    Click Element                       ${f_date}
    Wait Until Element Is Visible       ${search}
    Click Element                       ${search}
#    button pilih
    Wait Until Element Is Visible       ${expected_search}     30
    Element Text Should Be              ${expected_search}   ${EX_SEARCH}

Order Flight One Pass
    [Arguments]     ${PHONE_NUMBER}     ${PASPOR}   ${EX_TEXT}
    Click Element                       ${expected_search}
    Wait Until Element Is Visible       ${confirm}              10
    Click Element                       ${confirm}
    Wait Until Element Is Visible       ${phone}                10
    Click Element                       ${phone}
    Input Text                          ${phone}                ${PHONE_NUMBER}
    Wait Until Element Is Visible       ${same_data}
    Click Element                       ${same_data}
    Wait Until Element Is Visible       ${field_nation}
    Click Element                       ${field_nation}
#    Input Text                          ${nation}              ${NATIONALITY}
    Wait Until Element Is Visible       ${select_nation}
    Click Element                       ${select_nation}
    Wait Until Element Is Visible       ${field_birthdate}      10
    Click Element                       ${field_birthdate}
    Wait Until Element Is Visible       ${birthdate}
    Click Element                       ${birthdate}
    Wait Until Element Is Visible       ${field_monthbith}      10
    Click Element                       ${field_monthbith}
    Wait Until Element Is Visible       ${month}                10
    Click Element                       ${month}
    Wait Until Element Is Visible       ${field_yearbirth}      10
    Click Element                       ${field_yearbirth}
    Wait Until Element Is Visible       ${year}
    Click Element                       ${year}
    Wait Until Element Is Visible       ${field_paspor}         10
    Click Element                       ${field_paspor}
    Input Text                          ${field_paspor}         ${PASPOR}
    Wait Until Element Is Visible       ${field_dateexp}        10
    Click Element                       ${field_dateexp}
    Wait Until Element Is Visible       ${date_expired}         10
    Click Element                       ${date_expired}
    Wait Until Element Is Visible       ${field_monthexp}       10
    Click Element                       ${field_monthexp}
    Wait Until Element Is Visible       ${month_expired}        10
    Click Element                       ${month_expired}
    Wait Until Element Is Visible       ${field_yearexp}        10
    Click Element                       ${field_yearexp}
    Wait Until Element Is Visible       ${year_expired}         10
    Click Element                       ${year_expired}
    Wait Until Element Is Visible       ${field_country}        10
    Click Element                       ${field_country}
    Wait Until ELement Is Visible       ${select_country}       10
    Click Element                       ${select_country}
    Wait Until Element Is Visible       ${btn_confirm}          10
    Click Element                       ${btn_confirm}
    Wait Until Element Is Visible       ${detail_pemesan}       90
    Click Element                       ${btn_bayar}
    Wait Until Element Is Visible       ${ok_popup}             30
    Element Text Should Be              ${text_pop}             ${EX_TEXT}