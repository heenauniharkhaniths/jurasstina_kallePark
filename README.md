       # Test_Design_Document
 
#  test login functionality.
Ensures the login page loads correctly.
Checks that key input fields exist and are enabled for typing.
login test - with valid credentials
            and with invalid credentials
login test with valid credentials is very critical important to access system
login test with invalid credentials is critical for security reasons
error message when login is failed is critical for giving users feedback
multiple users tests the role-based access control


# Authentication & Core User Flow
The suite also includes authentication-related tests such as
registration, as well as post-login functionalities like dropdown 
test while buying ticket alerts.

These features were identified as critical because failure in any of
them would prevent the user from completing essential tasks.

# Test application
UI automation tests were implemented using Robot Framework with Browser to validate
critical user flow in a real browser.
Negative test cases were added to verify system behavior with invalid input and are 
tagged according to VG requirements.

TEST SUITE 3:

TEST DESIGN DOCUMENT – SAFARI BOOKING MODULE

Testare: Jad Ibrahim
Modul: Safari Booking System (Svit 3)
Datum: 2026-02-14
1. Identifierad Kritisk Funktionalitet

Jag ansvarar för att testa Safari-bokningssystemet. Detta är en affärskritisk funktion med följande krav:

    End-to-End Logik: För att boka en safari måste användaren först ha registrerat sig, loggat in och köpt en inträdesbiljett. Utan biljett får ingen safari bokas.

    Intäkter (Business Value): Guidade turer är en premiumprodukt. Om bokningsflödet (från biljett till safari) misslyckas, förlorar parken intäkter.

    Datavalidering: Systemet måste blockera ogiltiga datum (t.ex. datum i dåtiden) och ogiltiga biljettantal (t.ex. negativa tal).

2. Teststrategi & Verktyg

För att testa denna modul har jag använt Behavior Driven Development (BDD) och en modulär struktur.

    Metod: Gherkin-syntax (Given/When/Then) används för att beskriva flödet.

    Arkitektur: Testerna använder delade resursfiler (login_keywords.resource, register_keywords.resource, safari_keywords.resource) för att återanvända kod och minska underhåll.

    Verktyg: Robot Framework med SeleniumLibrary.

    Webbläsare: Firefox (optimerad med Set Selenium Speed för stabilitet).

3. Testfall (Test Cases)

Följande tre testfall är implementerade i suite3_safari_bdd.robot:
Test ID	Testfall	Typ	Beskrivning & Gherkin-scenario
TC-301	Successful Safari Booking (E2E)	Critical / Positive	

Verifierar hela flödet: Registrering -> Login -> Köp av biljett -> Bokning av safari.


GIVEN User creates account and logs in

AND User buys an entrance ticket

WHEN User enters a valid date "2026-03-02"

AND User clicks the Book button

THEN Success message "Booking Confirmed" should be displayed.
TC-302	Booking With Past Date	Negative	

Verifierar att systemet stoppar bokningar med datum i dåtiden.


GIVEN User creates account and logs in

AND User buys an entrance ticket

WHEN User enters date "2020-01-01"

THEN Error message "You cannot book a safari for a date in the past." should be displayed.
TC-304	Buy Ticket With Negative Quantity	Negative	

Verifierar att man inte kan köpa ett negativt antal biljetter.


GIVEN User is on the Home page

WHEN User tries to buy ticket with quantity "-1"

THEN System should reject the ticket purchase.
4. Användarflöde & Persona

Testerna är designade utifrån personan "Safari-Sven".

    Scenario: Sven är en ny besökare som vill boka allt på en gång, men han gör ofta felinmatningar.

    Testets syfte:

        Säkerställa att Sven kan registrera sig och köpa nödvändig inträdesbiljett smidigt (TC-301).

        Skydda systemet om Sven råkar välja ett gammalt datum (TC-302).

        Skydda systemet om Sven försöker "lura" varukorgen genom att köpa -1 biljetter (TC-304).
