*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
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

*** Keywords ***

# This is a keyword define to navigate to Report Page
ReportPage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234
    click element   ${signinbutton_Xpath}

    click element   ${ReportMenu_Xpath}

*** Test Cases ***

# This is a testcase to verify the Report Page Header
ReportHeader

    ReportPage
    set selenium implicit wait  ${timer}

    page should contain  Report

     ${get_text}  Get WebElements  ${ReportHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a testcase to verify the Report Mask Header
ReportMaskHeader

    ReportPage
    set selenium implicit wait  ${timer}

    page should contain  Report Mask

     ${get_text}  Get WebElements  ${ReportMaskHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a testcase to verify the Global Variable Header
GlobalVariableHeader

    ReportPage
    set selenium implicit wait  ${timer}

    page should contain  Global Variable

     ${get_text}  Get WebElements  ${GlobalVariableHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a testcase to create new Report
CreateNewReport

    ReportPage
    set selenium implicit wait  ${timer}

    click element   ${NewReportCreate_Xpath}

    input text  id:reportName  TestReport1
    input text  id:description  this is report under test

    click element   ${SelectSeperator_Xpath}

    click element   ${ReportSave_btn_Xpath}

    page should contain  Updated Successfully.
    close browser

# This is a testcase to verify the Report properties
ReportProperties

    ReportPage
    set selenium implicit wait  ${timer}

    click element  ${SelectReportCheckbox_Xpath}

    ${get_text}  Get WebElements  ${SelectedReportProperties_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a testcase to Edit Report
EditReport

    ReportPage
    set selenium implicit wait  ${timer}

    click element  ${SelectReportCheckbox_Xpath}

    click element   ${EditReport_Btn_Xpath}

    input text  id:reportName  Report1
    input text  id:description  this is edited report under test

    click element   ${EditChooseSeperator_Xpath}

    click element   ${EditedReportSave_btn_Xpath}

    page should contain  Updated Successfully.
    close browser

# This is a testcase to Delete Report
DeleteReport

    ReportPage
    set selenium implicit wait  ${timer}

    click element  ${SelectReportCheckbox_Xpath}

    click element   ${ReportDelete_btn_Xpath}

    click element   ${ReportConfirmDelete_btn_Xpath}

    page should contain  Deleted Successfully.
    close browser