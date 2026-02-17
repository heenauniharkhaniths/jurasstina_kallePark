*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://127.0.0.1:8000/jurap.html
${BROWSER}    chrome

*** Test Cases ***
Verifiera Startsidan
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Jurasstina    timeout=10s
    Capture Page Screenshot
    Close Browser


Verifiera Navigation
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//a
    Click Element    xpath=(//a)[1]
    Sleep    2s
    Capture Page Screenshot
    Close Browser
