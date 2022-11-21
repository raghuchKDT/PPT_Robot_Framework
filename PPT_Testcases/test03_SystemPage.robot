*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${SystemMenu_Xpath}  xpath://*[@id="two"]
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

*** Keywords ***

# This is a keyword defined to navigate to System Settings Page
SystemSettingsPage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

    click element   ${SystemMenu_Xpath}

*** Test Cases ***

# This is a tescase to verify the System Database data
systemDatabaseData

    SystemSettingsPage
    set selenium implicit wait  ${timer}

    ${get_text}  Get WebElements  ${SystemDatabaseData_Xpath}

    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a testcase to Edit Test Report
TestReportEdit

    SystemSettingsPage
    set selenium implicit wait  ${timer}

    click element   ${ClickTestReport_Xpath}

    click element   ${EditTestReport_Btn_Xpath}

    input text  id:value  2001

    click element   ${TestReport_SelectOption_Xpath}

    click element   ${EditTestReportSave_Btn_Xpath}

    page should contain  Data Added Successfully.
    close browser

# This is a testcase to Edit System Log
SystemLogEdit

    SystemSettingsPage
    set selenium implicit wait  ${timer}

    click element   ${ClickTestReport_Xpath}

    click element   ${EditSystemLog_Btn_Xpath}

    input text  id:names    PPT.App.Logs

    input text  id:values   1075

    click element   ${SystemLog_SelectOption_Xpath}

    click element   ${EditSystemLogSave_Btn_Xpath}

    page should contain  Data Added Successfully.
    close browser

# This is a testcase to select the language
SelectLanguage

    SystemSettingsPage
    set selenium implicit wait  ${timer}

    click element   ${Language_Xpath}

    click element   ${SelectLanguageRadio_Btn_Xpath}
    close browser

# This is a testcase to create new System Group
CreateNewSystemGroup

    SystemSettingsPage
    set selenium implicit wait  ${timer}

    click element   ${DeviceManagerTab_Xpath}

    click element   ${NewSystemGroup_Btn_Xpath}

    input text  id:txtNewSystemGroup   TestSystemGroup1

    input text  id:txtSysDescription   This is the System Group under test

    input text  id:txtSysSerialNumber   2

    click element   ${NewSystemGroup_Save_Xpath}

    page should contain  Added Successfully.

#    drag and drop   xpath://*[@id="2"]     xpath://*[@class="sysmike"]/h6
    close browser

# this is a testcase to verify the system properties
SystemGroupProperties

    SystemSettingsPage
    set selenium implicit wait  ${timer}

    click element   ${DeviceManagerTab_Xpath}

#    click element   ${SelectSystemGroup_Xpath}

     ${get_text}  Get WebElements   ${SystemGroupProp_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a testcase to verify the SystemGroup devices
SystemGroupDevices

    SystemSettingsPage
    set selenium implicit wait  ${timer}

    click element   ${DeviceManagerTab_Xpath}

    ${get_text}  Get WebElements  ${SystemGroupDevices_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# this is a testcase to verify the System Variable page
SystemVariablePage

    SystemSettingsPage
    set selenium implicit wait  ${timer}

    click element   ${SystemVariableTab_Xpath}

     ${get_text}  Get WebElements  ${SystemVariable_TableData_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser