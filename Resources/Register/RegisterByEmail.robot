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


#Expected
${expected_empty_pass}              css=#login-form > div.alert.alert-warning
${expexted_empty_email}             css=#login-form > div.alert.alert-warning
${expected_invalid_email_format}    css=#login-form > div:nth-child(1) > span > div > span


*** Keywords ***
Click Register Button
    [Arguments]
    Wait Until Element Is Visible       ${login}
    Click Element                       ${login}
    Sleep                               5s

Register Using Email
    [Arguments]  ${NAME} ${GENERATE_EMAIL}    ${PASSWORD}
    Wait Until Element Is Visible       ${daftar}
    Click Element                       ${daftar}
    Wait Until Element Is Visible       ${field_name}
    Click Element                       ${field_name}
    Input Element                       ${field_name}       ${NAME}
    Click Element                       ${field_email}
    Input Element                       ${field_email}      ${GENERATE_EMAIL}



