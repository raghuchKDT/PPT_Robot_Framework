*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resourec_System.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window

*** Keywords ***

# This is a keyword defined to navigate to System Settings Page
SystemSettingsPage

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