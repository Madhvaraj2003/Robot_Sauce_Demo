* Settings *
Library    SeleniumLibrary
Variables   ../variables/variables.robot
Resource    ../Variables/variables.robot


* Keywords *
# Opens the browser and maximizes the window  
Open Browser To Login Page
    Open Browser    ${URL}    chrome
    Maximize Browser Window

# Logins with the valid credentials
Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text    id:user-name    ${username}
    Input Text    id:password     ${password}
    Click Button  id:login-button
# Verifies the login 
Verify Successful Login
    Wait Until Page Contains Element    id:inventory_container

# This verifes the invalid login 
Verify Login Failed
    Wait Until Page Contains    Epic sadface: Username and password do not match

# Adds first product to the cart
Add First Product To Cart
    Click Button    xpath=//*[@id="add-to-cart-sauce-labs-backpack"]


# Adds multiple products to the cart
Add Multiple Products To Cart
    Click Button    xpath=//*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Button    xpath=//*[@id="add-to-cart-sauce-labs-onesie"]

# Navigates to the cart page and verifies the products
Go To Cart And Verify Product
    Click Element   class=shopping_cart_link
    Page Should Contain Element    xpath=//*[@id="header_container"]/div[2]/span

# Navigates to the cart page and clicks on checkout and fills the form and navigates to the cart list
Go To Checkout And Verify Summary
    Click Element    class=shopping_cart_link
# If you find any time issue or element not loaded use id=checkout
    Wait Until Page Contains Element   css=#checkout 
# We can use id=checkout if any error occurs       
    Click Button     css=#checkout
    Input Text       id=first-name     Automation
    Input Text       id=last-name      tester
    Input Text       id=postal-code    789464
    Click Button     id=continue
    Page Should Contain Element    class=cart_list  