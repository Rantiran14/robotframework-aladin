*** Settings ***
Documentation                   Regression Login Page Aladin
Library                         SeleniumLibrary
Resource                        /Users/ranti/Documents/automation-web-RF/Frameworks/Routers.robot


*** Variables ***
${EMAIL}                        rantester@mailinator.com
${PASSWORD}                     Tester123!
${WRONG_EMAIL}                  ran@gmail.com
${INVALID_EMAIL}                kakaka
${WRONG_PASS}                   jjjjjj
${PHONE_NUMBER}                 85894099479
${INVALID_NUMBER}               939399399
${UNREGIST_NUMBER}              087837378738

#Expected
${EMPTY_PASS}                   Mohon masukkan alamat e-mail dan password yang benar
${EMPTY_EMAIL}                  Mohon masukkan alamat e-mail dan password yang benar
${INCORRECT_FORMAT_EMAIL}       Format email kamu salah
${EMPTY_PHONE}                  Wajib diisi
${INVALID_PHONE}                Nomor telepon yang kamu masukkan salah. Nomor minimal harus 9 digit dan hanya terdiri dari angka.
${UNREGIST_PHONE}               Nomor telepon yang kamu masukkan belum terdaftar.


*** Test Cases ***
TC001 Success Login By Email
    [Documentation]  Success Login Browser By Email
    [Tags]  Regression
    Browsers.Open MyHeadless Keyword
    LoginByEmail.Click Login Button On Login Page
    LoginByEmail.Login Using Credentials        ${EMAIL}        ${PASSWORD}
    Browsers.Close Browser

TC002 Failed Login Empty Password
    [Documentation]  Failed Login Browser Empty Password
    [Tags]  Regression
    Browsers.Open MyHeadless Keyword
    LoginByEmail.Click Login Button On Login Page
    LoginByEmail.Login Email Only Login Page    ${EMAIL}        ${EMPTY_PASS}
    Browsers.Close Browser

TC003 Failed Login Empty Email
    [Documentation]  Failed Login Browser Empty Email
    [Tags]  Regression
    Browsers.Open MyHeadless Keyword
    LoginByEmail.Click Login Button On Login Page
    LoginByEmail.Login Password Only Login Page   ${PASSWORD}     ${EMPTY_EMAIL}
    Browsers.Close Browser

TC004 Failed Login Invalid Email
    [Documentation]  Failed Login Browser Invalid Format Email
    [Tags]  Regression
    Browsers.Open MyHeadless Keyword
    LoginByEmail.Click Login Button On Login Page
    LoginByEmail.Login Incorrect Format Email    ${INVALID_EMAIL}   ${INCORRECT_FORMAT_EMAIL}
    Browsers.Close Browser

TC005 Success Login By Phone
    [Documentation]  Success Login Browser By Phone Number
    [Tags]  Regression
    Browsers.Open MyHeadless Keyword
    LoginByPhone.Click Login Button On Login Page
    LoginByPhone.Login Using Phone Number       ${PHONE_NUMBER}
    Browsers.Close Browser

TC006 Failed Login Empty Phone
    [Documentation]  Failed Login Browser Empty Phone Number
    [Tags]  Regression
    Browsers.Open MyHeadless Keyword
    LoginByPhone.Click Login Button On Login Page
    LoginByPhone.Login Using Empty Phone Number     ${EMPTY_PHONE}
    Browsers.Close Browser

TC007 Failed Login Invalid Phone
    [Documentation]  Failed Login Browser Invalid Phone Number
    [Tags]  Regression

    ${RANDOM_NUMBER}        Generate random string      10      0123456789
    ${PHONE}                Catenate            ${RANDOM_NUMBER}

    Browsers.Open MyHeadless Keyword
    LoginByPhone.Click Login Button On Login Page
    LoginByPhone.Login Using Invalid Phone Number    ${PHONE}        ${INVALID_PHONE}
    Browsers.Close Browser

TC008 Failed Login Unregister Phone
    [Documentation]  Failed Login Browser Unregistered Phone Number
    [Tags]  Regression

    ${RANDOM_NUMBER}        Generate random string      7      0123456
    ${UNREG_PHONE}                Catenate            ${RANDOM_NUMBER}

    Browsers.Open MyHeadless Keyword
    LoginByPhone.Click Login Button On Login Page
    LoginByPhone.Login Using Unregistered Number    ${UNREG_PHONE}      ${UNREGIST_PHONE}
    Browsers.Close Browser