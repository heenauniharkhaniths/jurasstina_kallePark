*** Settings ***
Library     SeleniumLibrary
Resource    common.resource

*** Keywords ***
# --- GIVEN ---
User is on the Safari Booking page
    Navigate To Section    safari-nav    Book Safaris
    # VIKTIGT: Vi måste vänta tills sektionen faktiskt syns innan vi fortsätter
    Wait Until Element Is Visible    id=safari-section    timeout=5s

User is on the Home page
    Click Element    xpath=//a[text()='Home']
    Wait Until Element Is Visible    id=home-section
    Sleep    0.5s    # Liten paus för animationer

# --- WHEN ---
User enters a valid date "${date}"
    # VIKTIGT: Scrolla till elementet först ifall menyn skymmer det!
    Wait Until Element Is Visible    id=safari-date
    Scroll Element Into View         id=safari-date
    Input Text                       id=safari-date    ${date}

User clicks the Book button
    # Scrolla till knappen så vi säkert ser den
    Wait Until Element Is Visible    xpath=//form[@id='safari-form']//button
    Scroll Element Into View         xpath=//form[@id='safari-form']//button
    Click Button                     xpath=//form[@id='safari-form']//button

User tries to book without selecting a date
    Wait Until Element Is Visible    xpath=//form[@id='safari-form']//button
    Scroll Element Into View         xpath=//form[@id='safari-form']//button
    Click Button                     xpath=//form[@id='safari-form']//button

User clicks the Safari Card button
    # Vänta tills kortet syns och scrolla till det
    Wait Until Element Is Visible    xpath=//div[@class='card']//a[@data-section='safari-section']
    Scroll Element Into View         xpath=//div[@class='card']//a[@data-section='safari-section']
    Click Element                    xpath=//div[@class='card']//a[@data-section='safari-section']

# --- THEN ---
Success message "${expected_text}" should be displayed
    Wait Until Element Contains    id=safari-message    ${expected_text}

Error message "${expected_text}" should be displayed
    Wait Until Element Contains    id=safari-message    ${expected_text}

User should be on the Safari Booking page
    Wait Until Element Is Visible    id=safari-section    timeout=5s

    # --- NYA KEYWORDS FÖR CART/CHECKOUT ---
User goes to the Shopping Cart
    Click Element    id=cart-nav
    Wait Until Element Is Visible    id=cart-section

User clicks Proceed to Checkout
    Wait Until Element Is Enabled    id=checkout-button    timeout=5s
    Click Button    id=checkout-button

The Cart should be empty and order confirmed
    Alert Should Be Present    text=Thank you for your purchase!
