*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${UserManagerMenu_Xpath}    xpath://*[@id="four"]
${LocalUserHeader_Xpath}  xpath://*[@id="pills-user"]/div/div/div[1]/div[1]/div[1]/h6
${CreateNewUser_Btn_Xpath}   xpath://*[@id="bntGoToCreateUser"]
${SelectAccessLevel_Xpath}  xpath://*[@id="roleId"]/option[3]
${NewUserSave_Btn_Xpath}    xpath://*[@id="btn-userSave"]
${SelectUser_Xpath}  xpath://*[@id="tblUser"]/tbody/tr/td[1]/label/span
${UserProperties_Xpath}  xpath://*[@id="accordion"]/div
${ClickUserManagerEditBtn_Xpath}    xpath://*[@id="btn-userEdit"]
${EditAccessLevel_Xpath}    xpath://*[@id="editroleId"]/option[2]
${EditUserSave_Btn_Xpath}    xpath://*[@id="btn-userSave"]
${ClickDelete_Btn_Xpath}    xpath://*[@id="btn-userdelete"]
${ConfirmDelete_Btn_Xpath}    xpath://*[@id="btn-delete-user"]
${ClickUserDropDown_Xpath}  xpath://*[@id="userDropdown"]
${ClickLogout_Xpath}    xpath://*[@id="adminicon"]/ul/li/div/a

*** Keywords ***

UserManagerPage
        click element    ${UserManagerMenu_Xpath}

New btn to create user
        click element    ${CreateNewUser_Btn_Xpath}

input username
         [Arguments]    ${Username}
          Input Text   id:userName      ${Username}
input Pwd
         [Arguments]    ${Password}
         Input Text    id:password      ${Password}

Save btn
       set selenium implicit wait  ${timer}
       click element  ${NewUserSave_Btn_Xpath}

