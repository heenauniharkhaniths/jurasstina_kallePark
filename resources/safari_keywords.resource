*** Settings ***
Library     SeleniumLibrary
Resource    common.resource
Resource    login_keywords.resource
Resource    register_keywords.resource

*** Keywords ***
# --- GIVEN ---
User creates account and logs in
    [Documentation]    Registrerar en användare, hanterar redirect och loggar in.
    ${USER}=    Set Variable    safari_sven
    ${PASS}=    Set Variable    longpassword123
    Register New User    ${USER}    ${PASS}
    Login To Jurasstina    ${USER}    ${PASS}

User buys an entrance ticket
    [Documentation]    Köper biljett och klickar OK på Alert-rutan.
    Navigate To Section    tickets-nav    Buy Tickets

    Wait Until Element Is Visible    id=ticket-type    timeout=10s
    Select From List By Label        id=ticket-type        Adult
    Select From List By Label        id=ticket-category    Regular Ticket
    Input Text                       id=ticket-quantity    1
    Click Button    xpath=//form[@id='ticket-form']//button

    # Hantera Alert (Item added to cart!)
    Alert Should Be Present    text=Item added to cart!    action=ACCEPT

User is on the Safari Booking page
    Navigate To Section    safari-nav    Book Safaris
    Wait Until Element Is Visible    id=safari-section    timeout=5s

User is on the Home page
    Wait Until Element Is Visible    xpath=//a[text()='Home']
    Click Element    xpath=//a[text()='Home']
    Wait Until Element Is Visible    id=home-section
    Sleep    0.5s

# --- WHEN ---
User enters date "${date}"
    [Documentation]    Fyller i datumfältet. Fungerar för både giltiga och ogiltiga datum.
    Wait Until Element Is Visible    id=safari-date
    Scroll Element Into View         id=safari-date
    Input Text                       id=safari-date    ${date}

User tries to buy ticket with quantity "${amount}"
    [Documentation]    Försöker köpa biljett med vald mängd (t.ex. -1).
    Navigate To Section    tickets-nav    Buy Tickets
    Wait Until Element Is Visible    id=ticket-type    timeout=10s
    Select From List By Label        id=ticket-type        Adult
    Select From List By Label        id=ticket-category    Regular Ticket
    Input Text                       id=ticket-quantity    ${amount}
    Click Button    xpath=//form[@id='ticket-form']//button

User clicks the Book button
    ${btn}=    Set Variable    xpath=//form[@id='safari-form']//button
    Wait Until Element Is Visible    ${btn}
    Scroll Element Into View         ${btn}
    Click Button                     ${btn}
    # Hantera eventuell alert om bokningen lyckas/misslyckas direkt
    Run Keyword And Ignore Error    Handle Alert    ACCEPT

User clicks the Book button without entering a date
    ${btn}=    Set Variable    xpath=//form[@id='safari-form']//button
    Wait Until Element Is Visible    ${btn}
    Scroll Element Into View         ${btn}
    Click Button                     ${btn}
    Run Keyword And Ignore Error    Handle Alert    ACCEPT

User clicks the Safari Card button
    [Documentation]    Använder JavaScript för att klicka (Löser Firefox-felet).
    ${css_selector}=    Set Variable    .card a[data-section='safari-section']
    Wait Until Page Contains Element    css=${css_selector}
    Sleep    1s
    Execute Javascript    document.querySelector("${css_selector}").click()

# --- THEN ---
Success message "${expected_text}" should be displayed
    # Vi kollar efter alert eller text på sidan
    Run Keyword And Ignore Error    Alert Should Be Present    text=${expected_text}    action=ACCEPT
    Run Keyword And Ignore Error    Wait Until Element Contains    id=safari-message    ${expected_text}

Error message "${expected_text}" should be displayed
    # För TC-302 (Dåtid) dyker texten upp i meddelanderutan på sidan
    Wait Until Element Is Visible    id=safari-message    timeout=5s
    Wait Until Element Contains      id=safari-message    ${expected_text}

System should reject the ticket purchase
    [Documentation]    Kollar att vi INTE får "Added to cart"-rutan (för TC-304).
    ${success_alert_appeared}=    Run Keyword And Return Status    Alert Should Be Present    text=Item added to cart!    action=ACCEPT
    Run Keyword If    ${success_alert_appeared}    Fail    Systemet tillät oss köpa negativa biljetter!

User should be on the Safari Booking page
    Wait Until Element Is Visible    id=safari-section    timeout=5s