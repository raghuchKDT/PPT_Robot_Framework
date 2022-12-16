*** Settings ***
Resource    ../Resource_setupnteardown.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window


*** Test Cases ***

logintoPPT
    set selenium implicit wait  ${timer}

#    input text  id:UserName  OCUA4
#    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

# This test is to Verify the title of the Login page
LoginPageTitle
    set selenium implicit wait  ${timer}

    title should be    Push Pull Touch Login



# This is a test to verify the UserLogin header is present in the signin page
UserLoginHeader
    set selenium implicit wait  ${timer}

    click element   ${UserLoginHeader_Xpath}

    page should contain  User login



# This test is to verify the invalid login, when user enters incorrect credentials
InvalidlogintoPPT
    Open Browser and Maximize LoginPage
    set selenium implicit wait  ${timer}

    input text  id:UserName  admin
    input text  id:Password  dheeraj

    click element   ${signinbutton_Xpath}

    page should contain  Invalid Username or Password



# This is a test to verify the empty username field
EmptyUsernameField

    Open Browser and Maximize LoginPage
    set selenium implicit wait  ${timer}

    input text  id:Password  dheeraj

    click element   ${signinbutton_Xpath}

    page should contain  Required*



# This is a test to verify the empty password field
EmptyPasswordField
    Open Browser and Maximize LoginPage
    set selenium implicit wait  ${timer}

    input text  id:UserName  admin

    click element   ${signinbutton_Xpath}

    page should contain  Required*


# This is a test to verify the signin button is present in the page
SigninButton

    set selenium implicit wait  ${timer}

    page should contain  Sign in



# This is a test for Login into PPT machine
LoginTest

   Open Browser And Maximize
   set selenium implicit wait  ${timer}


# This is a test for Logout from PPT machine
LogOutTest
    Open Browser And Maximize
    set selenium implicit wait  ${timer}
    click element   ${ClickUserDropDown_Xpath}
    click element   ${ClickLogout_Xpath}

