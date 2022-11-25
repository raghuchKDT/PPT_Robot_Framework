*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${ModulePage_Xpath}  xpath://*[@id="pills-device-tab"]
${ProjectModuleHeader_Xpath}  xpath://*[@id="selespanProj"]
${NewModuleBtn_Xpath}   xpath://*[@id="deChk2"]/div[2]/div/button[1]
${ModuleSaveBtn_Xpath}  xpath://*[@id="btn-add-module"]
${SelectModule_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[3]/div/div/div[1]/span[1]/div/ul/li/a/h6
${EditModuleBtn_Xpath}  xpath://*[@id="deChk2"]/div[2]/div/button[2]
${EditedModuleSaveBtn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[10]/div/div/div[2]/div/button[2]
${CopyModuleBtn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[3]/div/div/div[1]/div[2]/div/button[3]
${CpyModuleSaveasBtn_Xpath}  xpath://*[@id="btn-copy-module"]
${ModuleDeleteBtn_Xpath}    xpath://*[@id="btn-DeleteModule"]
${ModuleConfirmDeleteBtn_Xpath}  xpath://*[@id="btn-delete-module"]
