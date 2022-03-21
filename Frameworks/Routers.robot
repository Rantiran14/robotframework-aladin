*** Settings ***
Library             SeleniumLibrary
Library             OperatingSystem
Library             String
#Library             RequestsLibrary
#Library             JSONLibrary
Library             Collections
#Library             ../Libraries/Labraries.py

### Import Resource ###
# Frameworks
Resource            ../Frameworks/Configs.robot
Resource            ../Resources/Common/Browsers.robot
Resource            ../Resources/Login/LoginByEmail.robot
Resource            ../Resources/Login/LoginByPhone.robot
Resource            ../Resources/Register/RegisterByEmail.robot
Resource            ../Resources/FlightInternational/FlightOneWay.robot