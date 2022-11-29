*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ReportMenu_Xpath}  xpath://*[@id="five"]
${ReportHeader_Xpath}  xpath://*[@id="pills-report"]/div/div/div[1]/div[1]/h6
${ReportMaskHeader_Xpath}   xpath://*[@id="pills-report"]/div/div/div[2]/h6[1]
${GlobalVariableHeader_Xpath}   xpath://*[@id="pills-report"]/div/div/div[3]/h6
${NewReportCreate_Xpath}    xpath://*[@id="bntGoToCreateReport"]
${SelectSeperator_Xpath}    xpath://*[@id="separator"]/option[5]
${ReportSave_btn_Xpath}    xpath://*[@id="btn-reportSave"]
${SelectReportCheckbox_Xpath}   xpath://*[@id="tblReport"]/tbody/tr/td[1]/label/span
${SelectedReportProperties_Xpath}   xpath://*[@id="accordion"]
${EditReport_Btn_Xpath}  xpath://*[@id="btn-reportEdit"]
${EditChooseSeperator_Xpath}    xpath://*[@id="separator"]/option[1]
${EditedReportSave_btn_Xpath}  xpath://*[@id="btn-reportSave"]
${ReportDelete_btn_Xpath}   xpath://*[@id="btn-reportdelete"]
${ReportConfirmDelete_btn_Xpath}    xpath://*[@id="btn-delete-report"]

