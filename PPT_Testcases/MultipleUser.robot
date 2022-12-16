*** Settings ***
Library       SeleniumLibrary
Library        DataDriver   ../Data Driven Reports/user_infoRobot.xlsx    sheet_name=Sheet1
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_usermanager.robot
Resource    ../Resource/Resource_MultipleUsers.robot
Resource    ../Resource/Resource_Info.robot

Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window
Test Template    User Create


*** Test Cases ***

MutlipleUsersExcel  using    ${Username}      ${Password}


*** Keywords ***

User Create
     click element    ${UserManagerMenu_Xpath}
     set selenium implicit wait  ${timer}
     New btn to create user
     set selenium implicit wait  ${timer}
     [Arguments]        ${Username}      ${Password}
     input username     ${Username}
     input Pwd          ${Password}
     set selenium implicit wait  ${timer}
     Save btn

