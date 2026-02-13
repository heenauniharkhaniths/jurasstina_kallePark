*** Settings ***
Documentation     Suite 3: Safari Booking System (BDD).
...               Testar bokningsflödet för Safari.
Resource          ../resources/common.resource
Resource          ../resources/safari_keywords.resource
Suite Setup       Start System
Suite Teardown    Close System
Test Tags         safari    bdd

*** Test Cases ***
TC-301 Successful Safari Booking
    [Documentation]    Verifierar att en användare kan boka safari med ett giltigt datum.
    [Tags]    critical    positive
    Given User is on the Safari Booking page
    When User enters a valid date "2025-07-15"
    And User clicks the Book button
    Then Success message "Booking Confirmed" should be displayed

TC-302 Booking Without Date Validation
    [Documentation]    Verifierar att systemet stoppar bokning om datum saknas.
    [Tags]    negative
    Given User is on the Safari Booking page
    When User clicks the Book button
    Then Error message "Please select a date" should be displayed

TC-303 Navigate Via Homepage Card
    [Documentation]    Verifierar navigering via kortet på startsidan.
    [Tags]    navigation
    Given User is on the Home page
    When User clicks the Safari Card button
    Then User should be on the Safari Booking page

    TC-301 Successful Safari Booking (End-to-End)
    [Documentation]    Bokar en safari OCH slutför köpet i kassan.
    [Tags]    critical    positive
    Given User is logged in
    And User is on the Safari Booking page
    When User enters a valid date "2025-07-15"
    And User clicks the Book button
    Then Success message "Booking Confirmed" should be displayed


    When User goes to the Shopping Cart
    And User clicks Proceed to Checkout
    Then The Cart should be empty and order confirmed