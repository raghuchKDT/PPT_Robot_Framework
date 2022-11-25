*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${VariantExplorerTab_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[2]/div/ul/li[5]/a
${VariantProjectPathHeader_Xpath}  xpath://*[@id="selespanProj"]
${NewVariant_Btn_Xpath}    xpath://*[@id="bntGoToCreateVariant"]
${NewVariantSaveBtn_Xpath}    xpath://*[@id="btn-VarSave"]
${SelectVariantcheckbox_Xpath}  xpath://*[@id="tblVariant"]/tbody/tr/td[1]/label/span
${VariantEdit_Btn_Xpath}  xpath://*[@id="btn-VarEdit"]
${VariantEdit_SaveBtn_Xpath}  xpath://*[@id="btn-VarSave"]
${VariantCopy_Btn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[2]/div[2]/div[1]/div/div[1]/div[2]/button[3]
${VariantCopy_SaveBtn_Xpath}  xpath://*[@id="btn-saveas-variant"]
${VariantDelete_Btn_Xpath}    xpath://*[@id="btn-Vardelete"]
${VariantConfirmDelete_Btn_Xpath}  xpath://*[@id="btn-delete-variant"]

