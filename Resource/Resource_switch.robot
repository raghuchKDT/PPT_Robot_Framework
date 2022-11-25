*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${SwitchPage_Xpath}  xpath://*[@id="pills-switch-tab"]
${SwitchPathHeader_Xpath}  xpath://*[@id="selespanProj"]
${CreateNewSwitchBtn_Xpath}   xpath://*[@id="bntGoToCreateSwicth"]
${SwitchSaveBtn_Xpath}  xpath://*[@id="btn-switchSave"]
${SelectSwitch_Xpath}   xpath://*[@id="tblswitch"]/tbody/tr/td[1]/label/span
${EditSwitchBtn_Xpath}  xpath://*[@id="btn-switchEdit"]
${EditedSwitchSaveBtn_Xpath}  xpath://*[@id="btn-switchSave"]
${CopySwitchBtn_Xpath}  xpath://*[@id="btn-SwitchSaveAs"]
${CpySwitchSaveasBtn_Xpath}  xpath://*[@id="btn-saveas-switch"]
${SwitchDeleteBtn_Xpath}    xpath://*[@id="btn-switchdelete"]
${SwitchConfirmDeleteBtn_Xpath}  xpath://*[@id="btn-delete-switch"]

