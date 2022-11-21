*** Settings ***

Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${UserLoginHeader_Xpath}    xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/div/h6
${ClickUserDropDown_Xpath}  xpath://*[@id="userDropdown"]
${ClickLogout_Xpath}    xpath://*[@id="adminicon"]/ul/li/div/a

*** Keywords ***
# This is a keyword to login to PPT Machine
logintoPPT
    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

*** Test Cases ***

# This test is to Verify the title of the Login page
LoginPageTitle

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    title should be    Push Pull Touch Login

    close browser

# This is a test to verify the UserLogin header is present in the signin page
UserLoginHeader

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    click element   ${UserLoginHeader_Xpath}

    page should contain  User login

    close browser

# This test is to verify the invalid login, when user enters incorrect credentials
InvalidlogintoPPT

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  admin
    input text  id:Password  dheeraj

    click element   ${signinbutton_Xpath}

    page should contain  Invalid Username or Password

    close browser

# This is a test to verify the empty username field
EmptyUsernameField

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:Password  dheeraj

    click element   ${signinbutton_Xpath}

    page should contain  Required*

    close browser

# This is a test to verify the empty password field
EmptyPasswordField
    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  admin

    click element   ${signinbutton_Xpath}

    page should contain  Required*

    close browser

# This is a test to verify the signin button is present in the page
SigninButton

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    page should contain  Sign in

    close browser

# This is a test for Login into PPT machine
LoginTest

   logintoPPT
   set selenium implicit wait  ${timer}
   close browser


# This is a test for Logout from PPT machine
LogOutTest

    logintoPPT
    set selenium implicit wait  ${timer}

    click element   ${ClickUserDropDown_Xpath}

    click element   ${ClickLogout_Xpath}

    close browser
