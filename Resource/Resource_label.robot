*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${LabelTab_Xpath}   xpath://*[@id="pills-label-tab"]
${ProjectLabelPathHeader_Xpath}  xpath://*[@id="selespanProj"]
${NewLabel_Btn_Xpath}    xpath://*[@id="bntGoToCreateLabel"]
${NewLabelSaveBtn_Xpath}    xpath://*[@id="btn-labelSave"]
${SelectLabelcheckbox_Xpath}    xpath://*[@id="tblLabel"]/tbody/tr/td[1]/label/span
${LabelEdit_Btn_Xpath}  xpath://*[@id="btn-LabelEdit"]
${LabelEdit_SaveBtn_Xpath}  xpath://*[@id="btn-labelSave"]
${LabelCopy_Btn_Xpath}  xpath://*[@id="btn-LabelSaveAs"]
${LabelCopy_SaveBtn_Xpath}  xpath://*[@id="btn-saveas-label"]
${LabelDelete_Btn_Xpath}    xpath://*[@id="btn-labeldelete"]
${LabelConfirmDelete_Btn_Xpath}  xpath://*[@id="btn-delete-label"]
