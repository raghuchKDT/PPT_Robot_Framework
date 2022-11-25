*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${SystemMenu_Xpath}  xpath://*[@id="two"]/span
${SystemDatabaseData_Xpath}  xpath://*[@id="collapseOne"]/div
${ClickTestReport_Xpath}    xpath://*[@id="headingTwo"]/h4/a
${EditTestReport_Btn_Xpath}  xpath://*[@id="btnEditTestReport"]
${TestReport_SelectOption_Xpath}    xpath://*[@id="optionValue"]/option[2]
${EditTestReportSave_Btn_Xpath}  xpath://*[@id="btn-add-testreport"]
${ClickSystemLog_Xpath}    xpath://*[@id="headingThree"]/h4/a
${EditSystemLog_Btn_Xpath}  xpath://*[@id="btnEditSystemLog"]
${SystemLog_SelectOption_Xpath}  xpath://*[@id="options"]/option[2]
${EditSystemLogSave_Btn_Xpath}   xpath://*[@id="btn-add-systemlog"]
${Language_Xpath}  xpath://*[@id="headingFour"]/h4/a
${SelectLanguageRadio_Btn_Xpath}    xpath://*[@id="inlineRadio2"]
${DeviceManagerTab_Xpath}   xpath://*[@id="pills-device-tab"]
${NewSystemGroup_Btn_Xpath}  xpath://*[@id="deChk2"]/div/button[1]
${NewSystemGroup_Save_Xpath}    xpath://*[@id="btn-add-sysGrp"]
${SelectSystemGroup_Xpath}  xpath://*[@id="mike-57"]
${SystemGroupProp_Xpath}    xpath://*[@id="sysData"]/div
${SystemGroupDevices_Xpath}  xpath://*[@id="pills-device"]/div/div/div[3]/div[1]
${SystemVariableTab_Xpath}  xpath://*[@id="pills-variables-tab"]
${SystemVariable_TableData_Xpath}   xpath://*[@id="tblSystemGlobalVar"]/thead
${ErrorCodeTab_Xpath}   xpath://*[@id="pills-errorcode-tab"]
${NewGlobalErrorCode_Btn_Xpath}  xpath://*[@id="btnAddGlobalError"]
${GlobalErrorCode_SaveBtn_Xpath}    xpath://*[@id="btn-add-globalerror"]
${SelectGlobalErrorCode_Xpath}  xpath://*[@id="tblGlobalErrorCodes"]/tbody/tr[1]/td[1]/label/span
${EditGlobalErrorCode_Btn_Xpath}    xpath://*[@id="EditGlobalError"]
${EditGlobalErrorCode_SaveBtn_Xpath}    xpath://*[@id="btn-edit-globalerror"]
${NewHardwareErrorCode_Btn_Xpath}    xpath://*[@id="AddTestHardware"]
${HardwareErrorCode_SaveBtn_Xpath}  xpath://*[@id="btn-add-testhardware"]
${SelectHardwareErrorCode_Xpath}    xpath://*[@id="tblTestHardwareErrorCodes"]/tbody/tr[1]/td[1]/label/span
${EditHardwareErrorCode_Btn_Xpath}  xpath://*[@id="EditTestHardware"]
${EditHardwareErrorCode_SaveBtn_Xpath}  xpath://*[@id="btn-edit-testhardware"]
${NewSoftwareErrorCode_Btn_Xpath}   xpath://*[@id="AddPPTSoftwareError"]
${SoftwareErrorCode_SaveBtn_Xpath}  xpath://*[@id="btn-add-pptSoftware"]
${SelectSoftwareErrorCode_Xpath}    xpath://*[@id="tblPPTSoftwareErrorCodes"]/tbody/tr[1]/td[1]/label/span
${EditSoftwareErrorCode_Btn_Xpath}  xpath://*[@id="EditPPTSoftware"]
${EditSoftwareErrorCode_SaveBtn_Xpath}   xpath://*[@id="btn-edit-pptSoftware"]
