*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
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
