*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser   http://127.0.0.1:8000/jurap.html    chrome
Suite Teardown    Close Browser

*** Variables ***


*** Test Cases ***
TC1 Loginwithvalidcredentials
    Click Link    xpath://*[@id="login-nav"]/a
    sleep    2
    input text    id:login-username    dino123
    input text    login-password   dino12345
    sleep    2
    Click Element    xpath://*[@id="login-form"]/button

TC2 Loginwithinvalipassword
    [Tags]    VG-HK
    Click Link    xpath://*[@id="login-nav"]/a
    sleep    2
    input text    id:login-username    dino123
    input text    login-password   dino54321
    sleep    2
    Click Element    xpath://*[@id="login-form"]/button


*** Keywords ***



