*** Settings ***
#Library                            SeleniumLibrary
Resource                            /Users/ranti/Documents/automation-web-RF/Frameworks/Routers.robot

*** Variables ***
${login}                            css=#site-header > div > div > div.col-9 > nav > ul > li.nav-item.nav-border > a
${login_phonenumber}                css=#page-phone-otp > div > div > div > div > div > div > div:nth-child(3) > div.d-flex.wrapper-tabs > div:nth-child(2) > span
${nohp}                             id=phoneNumber1_phone_number
${btn_login}                        css=#page-phone-otp > div > div > div > div > div > div > div:nth-child(3) > div.tab-content > div.tab-pane.form-wrapper.active > form.form-wrapper > button
#Expected
${expected_empty_phonenumber}              css=#login-form-number > div.help.is-danger > span
${expected_invalid_phonenumber}            css=#login-form-number > div.phone-number-invalid
${expected_unregist_phonenumber}           css=#swal2-content

*** Keywords ***
Click Login Button On Login Page
    Wait Until Element Is Visible       ${login}
    Click Element                       ${login}
    Sleep                               5s
#    Click Element                       ${validasi_invalid_data_login}

Login Using Phone Number
    [Arguments]         ${PHONE_NUMBER}
    Wait Until Element Is Visible       ${popup}
    Click Element                       ${ok_popup}
    Wait Until Element Is Visible       ${login_phonenumber}
    Click Element                       ${login_phonenumber}
    Wait Until Element Is Visible       ${nohp}
    Click Element                       ${nohp}
    Input Text                          ${nohp}              ${PHONE_NUMBER}
#    Wait Until Element Is Located       ${btn_login}
    Sleep                               10s
    Click Button                        ${btn_login}

Login Using Empty Phone Number
    [Arguments]     ${EMPTY_PHONE}
    Wait Until Element Is Visible       ${popup}
    Click Element                       ${ok_popup}
    Wait Until Element Is Visible       ${login_phonenumber}
    Click Element                       ${login_phonenumber}
    Wait Until Element Is Visible       ${nohp}
    Click Element                       ${btn_login}
    Element Text Should Be              ${expected_empty_phonenumber}       ${EMPTY_PHONE}

Login Using Invalid Phone Number
    [Arguments]     ${INVALID_NUMBER}   ${INVALID_PHONE}
    Wait Until Element Is Visible       ${popup}
    Click Element                       ${ok_popup}
    Wait Until Element Is Visible       ${login_phonenumber}
    Click Element                       ${login_phonenumber}
    Wait Until Element Is Visible       ${nohp}
    Click Element                       ${nohp}
    Input Text                          ${nohp}              ${INVALID_NUMBER}
    Click Element                       ${btn_login}
    Element Text Should Be              ${expected_invalid_phonenumber}     ${INVALID_PHONE}

Login Using Unregistered Number
    [Arguments]     ${UNREGIST_NUMBER}  ${UNREGIST_PHONE}
    Wait Until Element Is Visible       ${popup}
    Click Element                       ${ok_popup}
    Wait Until Element Is Visible       ${login_phonenumber}
    Click Element                       ${login_phonenumber}
    Wait Until Element Is Visible       ${nohp}
    Click Element                       ${nohp}
    Input Text                          ${nohp}              ${UNREGIST_NUMBER}
    Click Element                       ${btn_login}
    Element Text Should Be              ${expected_invalid_phonenumber}     ${UNREGIST_PHONE}

