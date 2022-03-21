*** Settings ***
Documentation                   Regression Login Page Aladin
Library                         SeleniumLibrary
Resource                        /Users/ranti/Documents/automation-web-RF/Frameworks/Routers.robot


*** Variables ***
${NAME}                         Testing
${INVALID_NAME}                 6228
${EMAIL}                        test@mailinator.com
${PASSWORD}                     Tester123!
${WRONG_EMAIL}                  ran@gmail.com
${INVALID_EMAIL}                kakaka
${WRONG_PASS}                   jjjjjj
${PHONE_NUMBER}                 85894099479
${INVALID_NUMBER}               939399399
${UNREGIST_NUMBER}              087837378738

#Expected
${EMPTY_NAME}                   Wajib diisi
${EMPTY_EMAIL}                  Wajib diisi
${EMPTY_PHONE}                  Wajib diisi
${IN_NAME}                      Fullname hanya terdiri dari huruf dan spasi
${IN_EMAIL}                     Format email kamu salah
${IN_PHONE}                     Nomor telepon yang kamu masukkan salah. Nomor minimal harus 9 digit dan hanya terdiri dari angka.


*** Test Cases ***
TC001 Success Register By Email
    [Documentation]  Success Register Browser By Email
    [Tags]  Regression

    ${RANDOM_NUMBER}        Generate random string      4      0123
    ${GENERATE_NO}                Catenate           ${RANDOM_NUMBER}
    ${GENERATE_EMAIL}             Catenate           test${GENERATE_NO}@mailinator.com
    ${PHONE_RANDOM}         Generate random string      12      8948574838

    Browsers.Open MyHeadless Keyword
    RegisterByEmail.Click Register Button
    RegisterByEmail.Register Using Email        ${NAME}         ${GENERATE_EMAIL}       ${PHONE_RANDOM}
    Browsers.Close Browser

TC002 Failed Register Empty Name
    [Documentation]  Failed Register Browser Empty Name
    [Tags]  Regression

    ${RANDOM_NUMBER}        Generate random string      4      0123
    ${GENERATE_NO}                Catenate           ${RANDOM_NUMBER}
    ${GENERATE_EMAIL}             Catenate           test${GENERATE_NO}@mailinator.com
    ${PHONE_RANDOM}         Generate random string      12      8948574838

    Browsers.Open MyHeadless Keyword
    RegisterByEmail.Click Register Button
    RegisterByEmail.Register Without Name           ${GENERATE_EMAIL}       ${PHONE_RANDOM}     ${EMPTY_NAME}
    Browsers.Close Browser

TC003 Failed Register Empty Email
    [Documentation]  Failed Register Browser Empty Email
    [Tags]  Regression

#    ${RANDOM_NUMBER}        Generate random string      4      0123
#    ${GENERATE_NO}                Catenate           ${RANDOM_NUMBER}
#    ${GENERATE_EMAIL}             Catenate           test${GENERATE_NO}@mailinator.com
    ${PHONE_RANDOM}         Generate random string      12      8948574838

    Browsers.Open MyHeadless Keyword
    RegisterByEmail.Click Register Button
    RegisterByEmail.Register Without Email         ${NAME}         ${PHONE_RANDOM}      ${EMPTY_EMAIL}
    Browsers.Close Browser

TC004 Failed Register Empty Phone
    [Documentation]  Success Register Browser Empty Phone
    [Tags]  Regression

    ${RANDOM_NUMBER}        Generate random string      4      0123
    ${GENERATE_NO}                Catenate           ${RANDOM_NUMBER}
    ${GENERATE_EMAIL}             Catenate           test${GENERATE_NO}@mailinator.com
#    ${PHONE_RANDOM}         Generate random string      12      8948574838

    Browsers.Open MyHeadless Keyword
    RegisterByEmail.Click Register Button
    RegisterByEmail.Register Without Number Phone    ${NAME}         ${GENERATE_EMAIL}      ${EMPTY_PHONE}
    Browsers.Close Browser

TC005 Failed Register Invalid Name
    [Documentation]  Success Register Browser Invalid Format Name
    [Tags]  Regression

    ${RANDOM_NUMBER}        Generate random string      4      0123
    ${GENERATE_NO}                Catenate           ${RANDOM_NUMBER}
    ${GENERATE_EMAIL}             Catenate           test${GENERATE_NO}@mailinator.com
    ${PHONE_RANDOM}         Generate random string      12      8948574838

    Browsers.Open MyHeadless Keyword
    RegisterByEmail.Click Register Button
    RegisterByEmail.Register Using Email        ${INVALID_NAME}         ${GENERATE_EMAIL}       ${PHONE_RANDOM}     #${IN_NAME}
    Browsers.Close Browser

TC006 Failed Register Invalid Email
    [Documentation]  Success Register Browser Invalid Email
    [Tags]  Regression

#    ${RANDOM_NUMBER}        Generate random string      4      0123
#    ${GENERATE_NO}                Catenate           ${RANDOM_NUMBER}
#    ${GENERATE_EMAIL}             Catenate           test${GENERATE_NO}@mailinator.com
    ${PHONE_RANDOM}         Generate random string      12      8948574838

    Browsers.Open MyHeadless Keyword
    RegisterByEmail.Click Register Button
    RegisterByEmail.Register Using Email        ${NAME}         ${INVALID_EMAIL}       ${PHONE_RANDOM}      ${IN_EMAIL}
    Browsers.Close Browser

TC007 Failed Register Invalid Phone
    [Documentation]  Success Register Browser Invalid Phone
    [Tags]  Regression

    ${RANDOM_NUMBER}        Generate random string      4      0123
    ${GENERATE_NO}                Catenate           ${RANDOM_NUMBER}
    ${GENERATE_EMAIL}             Catenate           test${GENERATE_NO}@mailinator.com
#    ${PHONE_RANDOM}         Generate random string      12      8948574838

    Browsers.Open MyHeadless Keyword
    RegisterByEmail.Click Register Button
    RegisterByEmail.Register Using Email        ${NAME}         ${GENERATE_EMAIL}       ${INVALID_NUMBER}   ${IN_PHONE}
    Browsers.Close Browser