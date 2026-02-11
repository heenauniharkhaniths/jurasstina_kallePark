TEST DESIGN DOCUMENT – SAFARI BOOKING MODULE

Testare: Jad Ibrahim, Modul: Safari Booking System (Svit 3) Datum: 2026-02-11
1. Identifierad Kritisk Funktionalitet

Jag har ansvarat för att testa Safari-bokningssystemet. Detta är en affärskritisk funktion av följande anledningar:

    Intäkter (Business Value): Guidade turer är en premiumprodukt. Om bokningen misslyckas förlorar parken betydande intäkter.

    Affärslogik: Systemet måste validera att ett datum är valt innan bokning sker för att undvika administrativa fel.

    Användarkrav: Bokning får endast göras av inloggade användare.

2. Teststrategi & Verktyg

För att testa denna modul har jag använt Behavior Driven Development (BDD).

    Metod: Gherkin-syntax (Given/When/Then) används för att tydligt beskriva beteendet ur användarens perspektiv.

    Verktyg: Robot Framework med SeleniumLibrary.

    Webbläsare: Jag använder firefox så Testerna är verifierade i Firefox.

3. Testfall (Test Cases)

Här är de tre testfall som implementerats i filen suite3_safari_bdd.robot.

Test ID	Testfall	Typ	Beskrivning & Gherkin-scenario
TC-301	Successful Safari Booking	Positive / Critical	

Verifierar att en inloggad användare kan boka en tur.


GIVEN User is logged in

AND User is on the Safari Booking page

WHEN User enters a valid date "2025-07-15"

THEN Success message "Booking Confirmed" should be displayed.
TC-302	Missing Date Validation	Negative	

Verifierar att systemet stoppar bokningar utan datum.


GIVEN User is logged in

WHEN User clicks the Book button without entering a date

THEN Error message "Please select a date" should be displayed.
TC-303	Navigation via Homepage	UX / Navigation	

Verifierar navigering via "Call-to-Action"-kortet på startsidan.


GIVEN User is on the Home page

WHEN User clicks the Safari Card button

THEN User should be on the Safari Booking page.


4. Användarflöde & Persona

Testerna är designade utifrån personan "Safari-Sven".

    Scenario: Sven vill boka en tur men glömmer ofta att fylla i alla fält.

    Testets syfte:

        Säkerställa att Sven tvingas logga in om han inte är det (Hanteras i Given-steget).

        Säkerställa att Sven får tydlig feedback (felmeddelande) om han glömmer datumet (TC-302).

        Bekräfta bokningen när han gör rätt (TC-301).