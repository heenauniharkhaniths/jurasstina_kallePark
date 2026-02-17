*** Settings ***
Library    SeleniumLibrary
Resource   common.resource

*** Keywords ***
Register New User
    [Arguments]    ${username}    ${password}
    Navigate To Section    register-nav    Register

    Wait Until Element Is Visible    id=reg-username
    Input Text    id=reg-username    ${username}
    Input Text    id=reg-password    ${password}

    Click Button    xpath=//form[@id='register-form']//button

    Run Keyword And Ignore Error    Wait Until Element Contains    id=register-message    uccess    timeout=2s

    Wait Until Element Is Visible    id=login-section    timeout=10s