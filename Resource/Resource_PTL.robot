*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]/span
${pickToLightPage_Xpath}  xpath://*[@id="pills-tab"]/li[3]/a
${PickToLightPathHeader_Xpath}  xpath://*[@id="selespanProj"]
${CreateNewPTLBtn_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[4]/div/div/div[1]/div[2]/div/button[1]
${PTLSaveBtn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[4]/div/div/div[2]/div/button[2]
${SelectPTL_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[4]/div/div/div[1]/span[1]/div/ul/li/a/h6
${EditPTLBtn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[4]/div/div/div[1]/div[2]/div/button[2]
${EditedPTLSaveBtn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[6]/div/div/div[2]/div/button[2]
${CopyPTLBtn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[4]/div/div/div[1]/div[2]/div/button[3]
${CpyPTLSaveasBtn_Xpath}  xpath://*[@id="btn-copy-pickToLight"]
${PTLDeleteBtn_Xpath}    xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[4]/div/div/div[1]/div[2]/div/button[4]
${PTLConfirmDeleteBtn_Xpath}  xpath://*[@id="btn-delete-picktoligt"]