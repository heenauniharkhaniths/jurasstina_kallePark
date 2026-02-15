*** Settings ***
Documentation     Suite 3: Safari Booking System (BDD).
...               Testar bokningsflödet för Safari.
Resource          ../resources/common.resource
Resource          ../resources/safari_keywords.resource
Test Setup        Start System
Test Teardown     Close System
Test Tags         safari    bdd

*** Test Cases ***
TC-301 Successful Safari Booking
    [Documentation]    Positivt test: Bokar med ett framtida datum.
    [Tags]    critical    positive
    Given User creates account and logs in
    And User buys an entrance ticket
    And User is on the Safari Booking page
    When User enters date "2026-03-02"
    And User clicks the Book button
    Then Success message "Booking Confirmed" should be displayed

TC-302 Booking With Past Date
    [Documentation]    Negativt test: Försöker boka ett datum i dåtiden (Ogiltigt).
    [Tags]    negative

    Given User creates account and logs in
    And User buys an entrance ticket
    And User is on the Safari Booking page

    When User enters date "2020-01-01"
    And User clicks the Book button

    Then Error message "You cannot book a safari for a date in the past." should be displayed
TC-304 Buy Ticket With Negative Quantity
    [Documentation]    Negativt test: Försöker köpa -1 biljetter.
    [Tags]    negative
    Given User is on the Home page
    When User tries to buy ticket with quantity "-1"
    Then System should reject the ticket purchase