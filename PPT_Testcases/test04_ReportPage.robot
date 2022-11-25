*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_Report.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window



*** Test Cases ***

# This is a testcase to verify the Report Page Header
ReportHeader

    click element   ${ReportMenu_Xpath}
    set selenium implicit wait  ${timer}
    sleep  2s

    page should contain  Report

     ${get_text}  Get WebElements  ${ReportHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END



# This is a testcase to verify the Report Mask Header
ReportMaskHeader


    click element   ${ReportMenu_Xpath}
    set selenium implicit wait  ${timer}

    page should contain  Report Mask

     ${get_text}  Get WebElements  ${ReportMaskHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END



# This is a testcase to verify the Global Variable Header
GlobalVariableHeader


    click element   ${ReportMenu_Xpath}
    set selenium implicit wait  ${timer}

    page should contain  Global Variable

     ${get_text}  Get WebElements  ${GlobalVariableHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END



# This is a testcase to create new Report
CreateNewReport


    click element   ${ReportMenu_Xpath}
    set selenium implicit wait  ${timer}

    click element   ${NewReportCreate_Xpath}

    input text  id:reportName  TestReport1
    input text  id:description  this is report under test

    click element   ${SelectSeperator_Xpath}

    click element   ${ReportSave_btn_Xpath}

    page should contain  Updated Successfully.


# This is a testcase to verify the Report properties
ReportProperties


    click element   ${ReportMenu_Xpath}
    set selenium implicit wait  ${timer}

    click element  ${SelectReportCheckbox_Xpath}

    ${get_text}  Get WebElements  ${SelectedReportProperties_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END



# This is a testcase to Edit Report
EditReport


    click element   ${ReportMenu_Xpath}
    set selenium implicit wait  ${timer}

    click element  ${SelectReportCheckbox_Xpath}

    click element   ${EditReport_Btn_Xpath}

    input text  id:reportName  Report1
    input text  id:description  this is edited report under test

    click element   ${EditChooseSeperator_Xpath}

    click element   ${EditedReportSave_btn_Xpath}

    page should contain  Updated Successfully.


# This is a testcase to Delete Report
DeleteReport


    click element   ${ReportMenu_Xpath}
    set selenium implicit wait  ${timer}

    click element  ${SelectReportCheckbox_Xpath}

    click element   ${ReportDelete_btn_Xpath}

    click element   ${ReportConfirmDelete_btn_Xpath}

    page should contain  Deleted Successfully.
