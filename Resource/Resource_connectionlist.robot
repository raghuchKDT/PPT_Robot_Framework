*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${VariantExplorerTab_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[2]/div/ul/li[5]/a
${ConnectionListTab_Xpath}   xpath://*[@id="pills-connectionlist-tab"]
${ConnectionListHeader_Xpath}  xpath://*[@id="pills-connectionlist"]/div[1]/a
${NewConnectionList_Btn_Xpath}    xpath://*[@id="bntCreateConnectionListDetail"]
${NewConnectionListSaveBtn_Xpath}    xpath://*[@id="btn-add-connectionDet"]
${SelectConnectionListcheckbox_Xpath}    xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[2]/div[2]/div[5]/div[1]/div[2]/div/div[2]/div[2]/div/div[1]/div/label/span
${ConnectionListEdit_Btn_Xpath}  xpath://*[@id="bntEditConnectionListDetail"]
${ConnectionListEdit_UpdateBtn_Xpath}  xpath://*[@id="btn-update-connectionDet"]
${ConnectionListCopy_Btn_Xpath}  xpath://*[@id="btn-conndetails-copy"]
${ConnectionListCopy_SaveAsBtn_Xpath}  xpath://*[@id="btn-copy-connection"]
${ConnectionListDelete_Btn_Xpath}    xpath://*[@id="btn-connectionlistDetaildelete"]
${ConnectionListConfirmDelete_Btn_Xpath}  xpath://*[@id="btn-delete-connectionlist"]
${ConnectionListNameHeader_Xpath}   xpath://*[@id="pills-connectionlist"]/div[1]/div[3]/div[1]/label
