*** Settings ***
Library    SeleniumLibrary
Resource   common.resource

*** Keywords ***
Login To Jurasstina
    [Arguments]    ${username}    ${password}
    [Documentation]    Loggar in med angivet namn och lösenord.

    Navigate To Section    login-nav    Login

    Wait Until Element Is Visible    id=login-username
    Input Text       id=login-username    ${username}
    Input Text       id=login-password    ${password}

    Click Button     xpath=//*[@id="login-form"]/button


    Run Keyword And Ignore Error    Handle Alert    ACCEPT
    Wait Until Page Contains    Welcome    timeout=5s