*** Settings ***
Documentation                   Regression Flight International Page Aladin
Library                         SeleniumLibrary
Resource                        /Users/ranti/Documents/automation-web-RF/Frameworks/Routers.robot


*** Variables ***
${EMAIL}                        rantester@mailinator.com
${PASSWORD}                     Tester123!
${DEPART}                       CGK
${DESTINATION}                  charles
${PHONE_NUMBER}                 085894099479
${NATIONALITY}                  indon
${PASPOR}                       2672727727

#Expected
${EX_SEARCH}                    Pilih
${EX_TEXT}                      Yakin mau membatalkan pemesanan ini?

*** Test Cases ***
#TC001 Search Flight Inter One Way
#    [Documentation]  Success Search Flight International One Way
#    [Tags]  Regression
#    Browsers.Open MyHeadless Keyword
##    LoginByEmail.Click Login Button On Login Page
##    LoginByEmail.Login Using Credentials        ${EMAIL}        ${PASSWORD}
#    FlightOneWay.Search Flight One        ${DEPART}   ${DESTINATION}  ${EX_SEARCH}
#    Browsers.Close Browser

TC002 Order Flight Inter One Way
    [Documentation]  Success Order Flight International One Way
    [Tags]  Regression
    Browsers.Open MyHeadless Keyword
    LoginByEmail.Click Login Button On Login Page
    LoginByEmail.Login Using Credentials            ${EMAIL}        ${PASSWORD}
    FlightOneWay.Search Flight One                  ${DEPART}   ${DESTINATION}  ${EX_SEARCH}
    FlightOneWay.Order Flight One Pass              ${PHONE_NUMBER}     ${PASPOR}   ${EX_TEXT}
#    Browsers.Close Browser
