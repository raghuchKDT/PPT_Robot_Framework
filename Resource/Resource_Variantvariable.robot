*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${VariantExplorerTab_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[2]/div/ul/li[5]/a
${VariantVariableTab_Xpath}   xpath://*[@id="pills-variantglobalvar-tab"]
${VariantVariableHeader_Xpath}  xpath://*[@id="selespanProj"]
${SelectVariantVariablecheckbox_Xpath}  xpath://*[@id="tblVariantGlobalVar"]/tbody/tr[1]/td[1]/label/span
${VariantVariableEdit_Btn_Xpath}  xpath://*[@id="btn-VariableEdit"]
${SelectCountPassFromList_Xpath}  xpath://*[@id="noFormat-1"]/option[5]
${VariantVariableEdit_SaveBtn_Xpath}  xpath://*[@id="btn-VariableSave"]
