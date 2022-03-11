*** Settings ***
#Library                            SeleniumLibrary
Resource                            /Users/ranti/Documents/automation-web-RF/Frameworks/Routers.robot

*** Variables ***
${login}                            css=#site-header > div > div > div.col-9 > nav > ul > li.nav-item.nav-border > a
${field_email}                      id=email
${field_password}                   id=password
${toogle_password}                  xpath=//body/div[@id='__nuxt']/div[@id='__layout']/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[3]/div[2]/div[1]/div[1]/form[1]/div[2]/span[1]/span[1]
${btn_login}                        css=#login-form > button
${forgot_password}                  class='login-forgot-otp'
${forgot_email}                     id='email'
${btn_forgot_password}              css=//#forgot-form > button
${validasi_invalid_data_login}      xpath=/html/body/div[6]/div/div[3]/button[1]
${popup}                            css=div#desktopBannerWrapped > div
${ok_popup}                         css=button#optInText


#Expected
${expected_empty_pass}              css=#login-form > div.alert.alert-warning
${expexted_empty_email}             css=#login-form > div.alert.alert-warning
${expected_invalid_email_format}    css=#login-form > div:nth-child(1) > span > div > span


*** Keywords ***
Click Login Button On Login Page
    Wait Until Element Is Visible       ${login}
    Click Element                       ${login}
    Sleep                               5s
#    Click Element                       ${validasi_invalid_data_login}

Login Using Credentials
    [Arguments]     ${EMAIL}    ${PASSWORD}
    Wait Until Element Is Visible       ${popup}
    Click Element                       ${ok_popup}
    Wait Until Element Is Visible       ${field_email}
    Click Element                       ${field_email}
    Input Text                          ${field_email}              ${EMAIL}
    Click Element                       ${field_password}
    Input Text                          ${field_password}           ${PASSWORD}
    Wait Until Element Is Visible       ${btn_login}
    Click Element                       ${btn_login}

Login Email Only Login Page
    [Arguments]     ${EMAIL}    ${EMPTY_PASS}
    Wait Until Element Is Visible       ${popup}
    Click Element                       ${ok_popup}
    Wait Until Element Is Visible       ${field_email}
    Click Element                       ${field_email}
    Input Text                          ${field_email}              ${EMAIL}
    Wait Until Element Is Visible       ${btn_login}
    Click Element                       ${btn_login}
    Wait Until Element Is Visible       ${expected_empty_pass}
    Element Text Should Be              ${expected_empty_pass}      ${EMPTY_PASS}

Login Password Only Login Page
    [Arguments]    ${PASSWORD}  ${EMPTY_EMAIL}
    Wait Until Element Is Visible       ${popup}
    Click Element                       ${ok_popup}
    Wait Until Element Is Visible       ${field_email}
    Click Element                       ${field_password}
    Input Text                          ${field_password}           ${PASSWORD}
    Wait Until Element Is Visible       ${btn_login}
    Click Element                       ${btn_login}
    Wait Until Element Is Visible       ${expexted_empty_email}
    Element Text Should Be              ${expexted_empty_email}     ${EMPTY_EMAIL}

Login Incorrect Format Email
    [Arguments]  ${INVALID_EMAIL}   ${INCORRECT_FORMAT_EMAIL}
    Wait Until Element Is Visible       ${popup}
    Click Element                       ${ok_popup}
    Wait Until Element Is Visible       ${field_email}
    Click Element                       ${field_email}
    Input Text                          ${field_email}              ${INVALID_EMAIL}
    Element Text Should Be              ${expected_invalid_email_format}    ${INCORRECT_FORMAT_EMAIL}

Forgot Password
    [Arguments]     ${EMAIL}
    Wait Until Element Is Visible       ${forgot_password}
    Click Element                       ${forgot_password}
    Input Text                          ${forgot_email}         ${EMAIL}
    Click Element                       ${btn_forgot_password}


