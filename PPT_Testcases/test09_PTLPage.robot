*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_PTL.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window


*** Keywords ***

# This is a keyword defined to navigate to Pick To Light page
PTLPage

    click element   ${ProjectMenu_Xpath}

    click element   ${pickToLightPage_Xpath}

*** Test Cases ***

# this is a testcase to verify the header of the Project Pick To Light path
ProjectPTLPath

    PTLPage
    set selenium implicit wait  ${timer}

    ${get_text}  Get WebElements  ${PickToLightPathHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END


# this is a testcase to create New Pick To Light
CreateNewPTL

    PTLPage
    set selenium implicit wait  ${timer}

    click element   ${CreateNewPTLBtn_Xpath}

    input text  id:txtNewPickToLight  TestPTL1
    input text  id:txtPickToLightDescription     This is the Pick To Light under test
    input text  id:txtLightLed    20

    click element   ${PTLSaveBtn_Xpath}

    page should contain  Pick To Light Added successfully.


# this is a testcase to Edit Pick To Light
EditPTL

    PTLPage
    set selenium implicit wait  ${timer}

#    click element   ${SelectPTL_Xpath}

    click element   ${EditPTLBtn_Xpath}

    input text  id:txtPickName  PTLTest1

    sleep   1

    input text  id:txtPickDesc     This is the edited Pick To Light under test

    sleep   1

    input text  id:txtPickNum    15

    click element   ${EditedPTLSaveBtn_Xpath}

    sleep   1

    page should contain  Pick To Light Updated successfully.


# This is a testcase to create a duplicate copy of Pick To Light
CopyPTL

    PTLPage
    set selenium implicit wait  ${timer}

#    click element   ${SelectPTL_Xpath}

    click element   ${CopyPTLBtn_Xpath}

    input text  id:txtCopyNewPickToLight  PTL2
    input text  id:txtCopyPickToLightDescription  This is duplicate Pick To Light under test

    click element   ${CpyPTLSaveasBtn_Xpath}

    page should contain  Added Successfully.


# This is a testcase to delete the selected Pick To Light
DeletePTL

    PTLPage
    set selenium implicit wait  ${timer}

    click element   ${SelectPTL_Xpath}

    click element   ${PTLDeleteBtn_Xpath}

    click element   ${PTLConfirmDeleteBtn_Xpath}

    page should contain  Pick To Light Deleted successfully.
