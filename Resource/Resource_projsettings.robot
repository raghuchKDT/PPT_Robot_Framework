*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]/span
${ProjectHeader_Xpath}  xpath://*[@id="pills-home"]/div/div[1]/h6
${CreateNewProject_Btn_Xpath}   xpath://*[@id="bntGoToCreateProject"]
${SelectPopUpTimer_xpath}   xpath://*[@id="popupTimer"]/option[6]
${ClickDeviceManager_xpath}  xpath://*[@id="headingTwo"]/h6/a
${NewProjectSelectSystemGroup_Xpath}    xpath://*[@id="systemGroup"]/option[3]
${NewProjectSave_Btn_Xpath}  xpath://*[@id="btn-Save"]
${ProjectProperties_Xpath}  xpath://*[@id="accordion"]/div[1]
${SelectProjectCheckbox_Xpath}  xpath://*[@id="tblProject"]/tbody/tr/td[1]/label/span
${EditProject_Btn_Xpath}    xpath://*[@id="btn-Edit"]
${EditProjectSelectSystemGroup_Xpath}   xpath://*[@id="systemGroup"]/option[2]
${EditedProjectSave_Btn_Xpath}   xpath://*[@id="btn-Save"]
${CopyProject_Btn_Xpath}    xpath://*[@id="btn-SaveAs"]
${CopyProjectSave_Btn_Xpath}    xpath://*[@id="btn-saveas-project"]
${Project_DeleteBtn_Xpath}    xpath://*[@id="btn-delete"]
${Project_ConfirmDeleteBtn_Xpath}   xpath://*[@id="btn-delete-project"]

