*** Settings ***
Documentation                   Regression Login Page Aladin
Library                         SeleniumLibrary
Resource                        /Users/ranti/Documents/automation-web-RF/Frameworks/Routers.robot


*** Variables ***
${NAME}                         Testing
${EMAIL}                        test@mailinator.com
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
TC001 Success Register By Email
    [Documentation]  Success Register Browser By Email
    [Tags]  Regression

    ${RANDOM_NUMBER}        Generate random string      4      0123
    ${GENERATE_NO}                Catenate           ${RANDOM_NUMBER}
    ${GENERATE_EMAIL}             Catenate           test${GENERATE_NO}@mailinator.com

    Browsers.Open MyHeadless Keyword
    LoginByEmail.Click Login Button On Login Page
    LoginByEmail.Login Using Credentials        ${GENERATE_EMAIL}       ${PASSWORD}
#    Browsers.Close Browser

