*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome

# Här är din specifika sökväg fixad (med framåt-slash för att det ska funka i webbläsaren)
${URL}        file:///C:/Users/Sandi/Desktop/lab-testing-auto/jurap.html

*** Keywords ***
Start System
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Welcome to Jurasstina-Kalle Park

Close System
    Close Browser

Navigate To Section
    [Arguments]    ${nav_id}    ${section_header}
    Wait Until Element Is Visible    id=${nav_id}
    Click Element    id=${nav_id}
    Wait Until Page Contains    ${section_header}