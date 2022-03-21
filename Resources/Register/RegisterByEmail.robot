*** Settings ***
#Library                            SeleniumLibrary
Resource                            /Users/ranti/Documents/automation-web-RF/Frameworks/Routers.robot

*** Variables ***
${daftar}                           css=#site-header > div > div > div.col-9 > nav > ul > li:nth-child(3) > a
${field_name}                       id=fullname
${field_email}                      id=email
${field_phonenumber}                id=phone_number_phone_number
${checkbox_tnc}                     id=termconditions
${btn_register}                     css=#page-phone-otp > div > div > div > div > div > div > span > form > button
${popup}                            css=div#desktopBannerWrapped > div
${ok_popup}                         css=button#optInText
${btn_verifotp}                     css=#page-phone-otp > div > div > div > div > div > div > div:nth-child(6) > button


#Expected
${expected_empty_name}              css=#page-phone-otp > div > div > div > div > div > div > span > form > div:nth-child(1) > span > div > span
${expexted_empty_email}             css=#page-phone-otp > div > div > div > div > div > div > span > form > div:nth-child(2) > span > div > span
${expected_invalid_email_format}    css=#login-form > div:nth-child(1) > span > div > span
${expected_invalid_name}            css=#page-phone-otp > div > div > div > div > div > div > span > form > div:nth-child(1) > span > div > span
${expected_invalid_email}           css=#page-phone-otp > div > div > div > div > div > div > span > form > div:nth-child(2) > span > div > span
${expected_invalid_phone}           css=#page-phone-otp > div > div > div > div > div > div > span > form > div:nth-child(3) > div.phone-number-invalid


*** Keywords ***
Click Register Button
    [Arguments]
    Wait Until Element Is Visible       ${login}
    Click Element                       ${login}
    Sleep                               5s

Register Using Email
    [Arguments]  ${NAME}     ${EMAIL}   ${PHONE_NUMBER}
    Wait Until Element Is Visible       ${daftar}
    Click Element                       ${daftar}
    Wait Until Element Is Visible       ${field_name}
    Click Element                       ${field_name}
    Input Text                          ${field_name}           ${NAME}
    Click Element                       ${field_email}
    Input Text                          ${field_email}          ${EMAIL}
    Click Element                       ${field_phonenumber}
    Input Text                          ${field_phonenumber}    ${PHONE_NUMBER}
    Click Element                       ${checkbox_tnc}
    Click Element                       ${btn_register}
#    Wait Until Element Is Visible       ${btn_verifotp}
#    Click Element                       ${btn_verifotp}


Register Without Name
    [Arguments]     ${EMAIL}   ${PHONE_NUMBER}  ${EMPTY_NAME}
    Wait Until Element Is Visible       ${daftar}
    Click Element                       ${daftar}
    Wait Until Element Is Visible       ${field_name}
    Click Element                       ${field_email}
    Input Text                          ${field_email}              ${EMAIL}
    Click Element                       ${field_phonenumber}
    Input Text                          ${field_phonenumber}        ${PHONE_NUMBER}
    Click Element                       ${checkbox_tnc}
    Click Element                       ${btn_register}
    Wait Until Element Is Visible       ${expected_empty_name}
    Element Text Should Be              ${expected_empty_name}      ${EMPTY_NAME}

Register Without Email
    [Arguments]  ${NAME}   ${PHONE_NUMBER}  ${EMPTY_EMAIL}
    Wait Until Element Is Visible       ${daftar}
    Click Element                       ${daftar}
    Wait Until Element Is Visible       ${field_name}
    Click Element                       ${field_name}
    Input Text                          ${field_name}               ${NAME}
    Click Element                       ${field_phonenumber}
    Input Text                          ${field_phonenumber}        ${PHONE_NUMBER}
    Click Element                       ${checkbox_tnc}
    Click Element                       ${btn_register}
    Wait Until Element Is Visible       ${expexted_empty_email}
    Element Text Should Be              ${expexted_empty_email}     ${EMPTY_EMAIL}

Register Without Number Phone
    [Arguments]  ${NAME}     ${EMAIL}   ${EMPTY_PHONE}
    Wait Until Element Is Visible       ${daftar}
    Click Element                       ${daftar}
    Wait Until Element Is Visible       ${field_name}
    Click Element                       ${field_name}
    Input Text                          ${field_name}                   ${NAME}
    Click Element                       ${field_email}
    Input Text                          ${field_email}                  ${EMAIL}
    Click Element                       ${checkbox_tnc}
    Click Element                       ${btn_register}
    Wait Until Element Is Visible       ${expected_empty_phonenumber}
    Element Text Should Be              ${expected_empty_phonenumber}   ${EMPTY_PHONE}

Register With Invalid Name
    [Arguments]  ${INVALID_NAME}     ${EMAIL}   ${PHONE_NUMBER}     #${IN_NAME}
    Wait Until Element Is Visible       ${daftar}
    Click Element                       ${daftar}
    Wait Until Element Is Visible       ${field_name}
    Click Element                       ${field_name}
    Input Text                          ${field_name}               ${INVALID_NAME}
    Click Element                       ${field_email}
    Input Text                          ${field_email}              ${EMAIL}
    Click Element                       ${field_phonenumber}
    Input Text                          ${field_phonenumber}        ${PHONE_NUMBER}
    Click Element                       ${checkbox_tnc}
    Click Element                       ${btn_register}
#    Wait Until Element Is Visible       ${expected_invalid_name}
#    Element Text Should Be              ${expected_invalid_name}    ${IN_NAME}

Register With Invalid Email
    [Arguments]  ${NAME}     ${INVALID_EMAIL}   ${PHONE_NUMBER}     ${IN_EMAIL}
    Wait Until Element Is Visible       ${daftar}
    Click Element                       ${daftar}
    Wait Until Element Is Visible       ${field_name}
    Click Element                       ${field_name}
    Input Text                          ${field_name}               ${NAME}
    Click Element                       ${field_email}
    Input Text                          ${field_email}              ${INVALID_EMAIL}
    Click Element                       ${field_phonenumber}
    Input Text                          ${field_phonenumber}        ${PHONE_NUMBER}
    Click Element                       ${checkbox_tnc}
    Click Element                       ${btn_register}
    Wait Until Element Is Visible       ${expected_invalid_email}
    Element Text Should Be              ${expected_invalid_email}   ${IN_EMAIL}

Register With Invalid Phone
    [Arguments]  ${NAME}     ${EMAIL}   ${INVALID_NUMBER}   ${IN_PHONE}
    Wait Until Element Is Visible       ${daftar}
    Click Element                       ${daftar}
    Wait Until Element Is Visible       ${field_name}
    Click Element                       ${field_name}
    Input Text                          ${field_name}               ${NAME}
    Click Element                       ${field_email}
    Input Text                          ${field_email}              ${EMAIL}
    Click Element                       ${field_phonenumber}
    Input Text                          ${field_phonenumber}        ${INVALID_NUMBER}
    Click Element                       ${checkbox_tnc}
    Click Element                       ${btn_register}
    Wait Until Element Is Visible       ${expected_invalid_phone}
    Element Text Should Be              ${expected_invalid_phone}   ${IN_PHONE}

