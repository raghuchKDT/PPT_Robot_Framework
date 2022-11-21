*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${VariantExplorerTab_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[2]/div/ul/li[5]/a
${WireTab_Xpath}   xpath://*[@id="pills-wire-tab"]
${WirePathHeader_Xpath}  xpath://*[@id="selespanProj"]
${NewWireBtn_Xpath}    xpath://*[@id="deChk2"]/div[1]/div[1]/div[1]/button[1]
${SelectWireColor1_Xpath}   xpath://*[@id="drdcolor1"]/option[3]
${SelectWireColor2_Xpath}   xpath://*[@id="drdcolor2"]/option[4]
${SelectWireColor3_Xpath}   xpath://*[@id="drdcolor3"]/option[1]
${SelectWirePTLName_Xpath}  xpath://*[@id="drdPickToLightId"]/option[2]
${SelectWireWLEDname_Xpath}  xpath://*[@id="txtNewWledPinName"]/option[6]
${NewWireSaveBtn_Xpath}    xpath://*[@id="btn-add-wire"]
${SelectWirecheckbox_Xpath}    xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[2]/div[2]/div[3]/div[2]/div/div/div[1]/div[2]/div[2]/div/div[1]/div/input
${WireEdit_Btn_Xpath}  xpath://*[@id="btn-wire-edit"]
${EditWireColor1_Xpath}  xpath://*[@id="drdcolor1"]/option[1]
${EditWireColor2_Xpath}  xpath://*[@id="drdcolor2"]/option[2]
${EditWireColor3_Xpath}  xpath://*[@id="drdcolor3"]/option[4]
${EditWirePTLName_Xpath}    xpath://*[@id="drdPickToLightId"]/option[2]
${EditWireWLEDname_Xpath}   xpath://*[@id="txtNewWledPinName"]/option[5]
${EditWireUpdateBtn_Xpath}  xpath://*[@id="btn-update-wire"]
${WireCopy_Btn_Xpath}   xpath://*[@id="btn-wire-copy"]
${CopyWireSaveAsBtn_Xpath}  xpath://*[@id="btn-copy-wire"]
${WireDelete_Btn_Xpath}  xpath://*[@id="btn-wire-delete"]
${WireConfirmDelete_Btn_Xpath}  xpath://*[@id="btn-delete-wire"]

*** Keywords ***

# This is a Keyword that navigates to Wire Page
WirePage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

    click element   ${ProjectMenu_Xpath}

    click element   ${VariantExplorerTab_Xpath}

    click element   ${WireTab_Xpath}

*** Test Cases ***

# This is a testcase to verify the project path to Wire page
WirePageHeader

    WirePage
    set selenium implicit wait  ${timer}

     ${get_text}  Get WebElements  ${WirePathHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a testcase to create new Wire
CreateNewWire

    WirePage
    set selenium implicit wait  ${timer}

    click element   ${NewWireBtn_Xpath}

    input text  id:txtNewWireId  1121
    input text  id:drdGrpId  2

    click element   ${SelectWireColor1_Xpath}

    click element   ${SelectWireColor2_Xpath}

    click element   ${SelectWireColor3_Xpath}

    input text  id:txtNewPushMinValue  4
    input text  id:txtNewPushMaxValue  6
    input text  id:txtNewPullMinValue  2
    input text  id:txtNewPullMaxValue  8

    click element   ${SelectWirePTLName_Xpath}

    click element   ${SelectWireWLEDname_Xpath}

    click element   ${NewWireSaveBtn_Xpath}

    page should contain  Wire Added successfully.
    close browser

# This is a testcase to create Edit Wire
EditWire

    WirePage
    set selenium implicit wait  ${timer}

    click element   ${SelectWirecheckbox_Xpath}

    click element   ${WireEdit_Btn_Xpath}

    input text  id:txtNewWireId  2111
    input text  id:drdGrpId  1

    click element   ${EditWireColor1_Xpath}

    click element   ${EditWireColor2_Xpath}

    click element   ${EditWireColor3_Xpath}

    click element   ${EditWirePTLName_Xpath}

    input text  id:txtNewPushMinValue  6
    input text  id:txtNewPushMaxValue  8
    input text  id:txtNewPullMinValue  4
    input text  id:txtNewPullMaxValue  10

    click element   ${EditWireWLEDname_Xpath}

    click element   ${EditWireUpdateBtn_Xpath}

    page should contain  Wire Updated successfully.
    close browser

# This is a testcase to create copy of a Wire
CopyWire

    WirePage
    set selenium implicit wait  ${timer}

    click element   ${SelectWirecheckbox_Xpath}

    click element   ${WireCopy_Btn_Xpath}

    click element   ${CopyWireSaveAsBtn_Xpath}

    wait until page contains    New wire created successfully
    close browser

# This is a testcase to delete selected Wire
DeleteWire

    WirePage
    set selenium implicit wait  ${timer}

    click element   ${SelectWirecheckbox_Xpath}

    click element   ${WireDelete_Btn_Xpath}

    click element   ${WireConfirmDelete_Btn_Xpath}

    wait until page contains  wire deleted successfully
    close browser