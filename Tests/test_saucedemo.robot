* Settings *
Documentation     Test cases for SauceDemo using Robot Framework.
Resource          ../resources/keywords.robot
Variables         ../variables/variables.robot
Resource          ../Variables/variables.robot

# Tests all test cases
* Test Cases *

# Test case for valid  login
Test Case 1 - Valid Login
    Open Browser To Login Page
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Successful Login
    Close Browser
# Test case for invalid login
Test Case 2 - Invalid Login
    Open Browser To Login Page
    Login With Credentials    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Verify Login Failed
    Close Browser

# Test case for adding only one single product to the cart
Test Case 3 - Add Single Product To Cart
    Open Browser To Login Page
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Successful Login
    Add First Product To Cart
    Go To Cart And Verify Product
    Close Browser

# Test case for adding multiple products
Test Case 4 - Add Multiple Products and Checkout
    Open Browser To Login Page
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Successful Login
    Add Multiple Products To Cart
    Go To Checkout And Verify Summary
# Closes the browser after runnung the test cases    
    Close Browser