*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_switch.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window

*** Keywords ***

# This is a keyword defined to navigate to Switch page
SwitchPage

    click element   ${ProjectMenu_Xpath}

    click element   ${SwitchPage_Xpath}

*** Test Cases ***

# this is a testcase to verify the Projectpath to Switch page
ProjectSwitchPath

    SwitchPage
    set selenium implicit wait  ${timer}

    ${get_text}  Get WebElements  ${SwitchPathHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END


# this is a testcase to create New Switch
CreateNewSwitch

    SwitchPage
    set selenium implicit wait  ${timer}

    click element   ${CreateNewSwitchBtn_Xpath}

    input text  id:switchGroup  TestSwitch1

    click element   ${SwitchSaveBtn_Xpath}

    page should contain  Updated Successfully.


# this is a testcase to Edit Switch
EditSwitch

    SwitchPage
    set selenium implicit wait  ${timer}

    click element   ${SelectSwitch_Xpath}

    click element   ${EditSwitchBtn_Xpath}

    input text  id:switchGroup  Switch1

    click element   ${EditedSwitchSaveBtn_Xpath}

    page should contain  Updated Successfully.

# this is a testcase to create a duplicate of Switch
CopySwitch

    SwitchPage
    set selenium implicit wait  ${timer}

    click element   ${SelectSwitch_Xpath}

    click element   ${CopySwitchBtn_Xpath}

    input text  id:txtNewSwitchName  Switch2

    click element   ${CpySwitchSaveasBtn_Xpath}

    page should contain  Data Added Successfully.



# This is a testcase to delete the Switch
DeleteSwitch

    SwitchPage
    set selenium implicit wait  ${timer}

    click element   ${SelectSwitch_Xpath}

    click element   ${SwitchDeleteBtn_Xpath}

    click element   ${SwitchConfirmDeleteBtn_Xpath}

    page should contain  Deleted Successfully.

