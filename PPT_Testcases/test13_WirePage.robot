*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_wire.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window

*** Keywords ***

# This is a Keyword that navigates to Wire Page
WirePage

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


# This is a testcase to create copy of a Wire
CopyWire

    WirePage
    set selenium implicit wait  ${timer}

    click element   ${SelectWirecheckbox_Xpath}

    click element   ${WireCopy_Btn_Xpath}

    click element   ${CopyWireSaveAsBtn_Xpath}

    wait until page contains    New wire created successfully


# This is a testcase to delete selected Wire
DeleteWire

    WirePage
    set selenium implicit wait  ${timer}

    click element   ${SelectWirecheckbox_Xpath}

    click element   ${WireDelete_Btn_Xpath}

    click element   ${WireConfirmDelete_Btn_Xpath}

    wait until page contains  wire deleted successfully
