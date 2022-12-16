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

input User
         [Arguments]    ${Username}
          Input Text   id:UserName      ${Username}

input Password
         [Arguments]    ${Password}
         Input Text    id:Password      ${Password}
Signin
      set selenium implicit wait  ${timer}
      click element   ${signinbutton_Xpath}


Logout
    click element   ${ClickUserDropDown_Xpath}
    set selenium implicit wait  ${timer}
    click element   ${ClickLogout_Xpath}