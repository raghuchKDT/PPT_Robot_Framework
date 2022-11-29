*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${UserManagerMenu_Xpath}    xpath://*[@id="four"]
${RoleTab_Xpath}    xpath://*[@id="pills-device-tab"]
${AccessLevelHeader_Xpath}  xpath://*[@id="pills-device"]/div/div[2]/h6
${AccessSectionHeader_Xpath}  xpath://*[@id="pills-device"]/div/div[3]/h6
${AccessSectionData_Xpath}    xpath://*[@id="accordion"]/div
${RoleTableData_Xpath}  xpath://*[@id="tblRole_wrapper"]/div[1]
${SelectedRole_Xpath}   xpath://*[@id="tblRole"]/tbody/tr[3]/td[1]/label/span
${CreateNewRole_Btn_Xpath}  xpath://*[@id="bntGoToCreateRole"]
${NewRoleSave_Btn_Xpath}  xpath://*[@id="btn-roleSave"]
${EditRole_Btn_Xpath}   xpath://*[@id="btn-roleEdit"]
${EditRoleSave_Btn_Xpath}    xpath://*[@id="btn-roleSave"]
${ClickDeleteRole_Btn_Xpath}   xpath://*[@id="btn-roledelete"]
${ConfirmDeleteRole_Btn_Xpath}  xpath://*[@id="btn-delete-role"]
