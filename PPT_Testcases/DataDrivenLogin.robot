*** Settings ***
Library       SeleniumLibrary
Library        DataDriver   ../Data Driven Reports/user_infoRobot.xlsx    sheet_name=Sheet1
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_Datadrivenlogin.robot
Resource    ../Resource/Resource_Info.robot

Test Setup       Open Browser And Maximize LoginPage
Test Teardown    Close Browser Window
Test Template    MultipleLogin



*** Test Cases ***

LoginDataDriven  using    ${Username}      ${Password}


*** Keywords ***

MultipleLogin

     set selenium implicit wait  ${timer}
     [Arguments]        ${Username}      ${Password}
     Input User         ${Username}
     Input Password      ${Password}
     Signin
     Logout
