*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${VariantExplorerTab_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[2]/div/ul/li[5]/a
${SpliceTab_Xpath}   xpath://*[@id="pills-splice-tab"]
${SplicePathHeader_Xpath}  xpath://*[@id="selespanProj"]
${NewSplice_Btn_Xpath}    xpath://*[@id="bntGoToCreateSplice"]
${SelectCableGroup_Xpath}   xpath://*[@id="spliceType"]/option[2]
${NewSpliceSaveBtn_Xpath}    xpath://*[@id="btn-spliceSave"]
${SelectSpliceCheckbox_Xpath}   xpath://*[@id="tblSplice"]/tbody/tr[1]/td[1]/label/span
${EditSplice_Btn_Xpath}  xpath://*[@id="btn-spliceEdit"]
${EditSpliceSaveBtn_Xpath}  xpath://*[@id="btn-spliceSave"]
${CopySplice_Btn_Xpath}  xpath://*[@id="btn-SpliceSaveAs"]
${CopySpliceSaveBtn_Xpath}  xpath://*[@id="btn-saveas-splice"]
${DeleteSplice_Btn_Xpath}   xpath://*[@id="btn-splicedelete"]
${ConfirmDeleteSpliceBtn_Xpath}  xpath://*[@id="btn-delete-splice"]
