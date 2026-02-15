*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome

${URL}        file:///C:/Users/Sandi/Desktop/lab-testing-auto/jurap.html

*** Keywords ***
Start System
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.2s
    Wait Until Page Contains    Welcome to Jurasstina-Kalle Park

Close System
    Close Browser

Navigate To Section
    [Arguments]    ${nav_id}    ${section_header}
    Wait Until Element Is Visible    id=${nav_id}
    Click Element    id=${nav_id}
    Wait Until Page Contains    ${section_header}