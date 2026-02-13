       # Test_Design_Document
 
#  test login functionality.
login test - with valid credentials
             invalid credentials
login test with valid credentials is very critical important to access system
login test with invalid credentials is critical for security reasons
error message when login is failed is critical for giving users feedback
login button disabled when fields are empty is critical to show the validation
of input.

# Authentication & Core User Flow
The suite also includes authentication-related tests such as
registration, and logout, as well as post-login functionalities like
ticket purchasing, alerts, shopping cart checkout.

These features were identified as critical because failure in any of
them would prevent the user from completing essential tasks or revenue.

# Test application
UI automation tests were implemented using Robot Framework with Browser to validate
critical user flow in a real browser.
Negative test cases were added to verify system behavior with invalid input and are 
tagged according to VG requirements.


