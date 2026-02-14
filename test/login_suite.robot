*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser   http://127.0.0.1:8000/jurap.html    chrome
Suite Teardown    Close All Browsers

*** Variables ***


*** Test Cases ***
TC1 VerifyLoginPage
    Click Link    xpath://*[@id="login-nav"]/a

    Element Should Be Visible    id:login-username
    Element Should Be Enabled    id:login-username
    Sleep    2s
    Element Should Be Visible    id:login-password
    Element Should Be Enabled    id:login-password
    Sleep    2s

TC2 Loginwithvalidcredentials
    Click Link    xpath://*[@id="login-nav"]/a
    sleep    2
    input text    id:login-username    dino123
    input text    login-password   dino12345
    sleep    2
    Click Element    xpath://*[@id="login-form"]/button

TC3 LoginwithInvalidPassword
    [Tags]    VG-HK
    Click Link    xpath://*[@id="login-nav"]/a
    sleep    2
    input text    id:login-username    dino123
    input text    login-password   dino54321
    sleep    2
    Click Element    xpath://*[@id="login-form"]/button

TC4 LoginwithinvalidUsername
    invalidusername

TC5 regularUserLogin valid
    [Template]    Login And Logout Template
    veloci343    velocipass

AdminLogin Valid
    [Template]    Login And Logout Template
    rex999    rexpass

TC6 registrationForm
    Click Link    xpath://*[@id="register-nav"]/a
    Sleep    2
    Input Text    id:reg-username     dino123
    Input Text    id:reg-password     dino12345
    Sleep    2
    Wait Until Element Is Visible    xpath://*[@id="register-form"]/button    10s
    Click Button   xpath://*[@id="register-form"]/button



*** Keywords ***
invalidusername
    [Tags]    VG-HK
    Click Link    xpath://*[@id="login-nav"]/a
    sleep    2
    input text    id:login-username    raptors
    input text    login-password   dino12345
    sleep    2
    Click Element    xpath://*[@id="login-form"]/button

    Wait Until Element Contains
    ...    id=login-message
    ...    Invalid username or password
    ...    5s

    Element Should Contain
    ...    id=login-message
    ...    Invalid username or password

Login And Logout Template

    [Arguments]    ${username}    ${password}
    Click Element    xpath://*[@id="login-nav"]/a
    Input Text       id:login-username    ${username}
    Input Text       id:login-password    ${password}
    Click Element    xpath://*[@id='login-form']/button
    Sleep    5s
    Execute JavaScript    document.getElementById('logout-nav').style.display='block'
    Execute JavaScript    document.getElementById('logout-link').click()
    Sleep    1s
