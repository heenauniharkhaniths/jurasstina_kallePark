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


