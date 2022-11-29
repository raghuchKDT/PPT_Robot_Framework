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
Open Browser And Maximize
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    input text  id:UserName  OCUA4
    input text  id:Password  1234
    click element   ${signinbutton_Xpath}
    Sleep  2s

Close Browser Window
    Close Browser
    Log To Console  Test Completed


Open Browser and Maximize LoginPage

    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window

    Sleep  2s