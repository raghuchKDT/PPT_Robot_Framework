*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_splice.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window


*** Keywords ***

# This is a Keyword that navigates to Splice Page
SplicePage

    click element   ${ProjectMenu_Xpath}

    click element   ${VariantExplorerTab_Xpath}

    click element  ${SpliceTab_Xpath}

*** Test Cases ***

# This is a testcase to verify the project path to Splice page
SplicePageHeader

    SplicePage
    set selenium implicit wait  ${timer}

     ${get_text}  Get WebElements  ${SplicePathHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END



# This is a testcase to create new Splice
CreateNewSplice

    SplicePage
    set selenium implicit wait  ${timer}

    click element   ${NewSplice_Btn_Xpath}

    input text  id:spliceName  TestSplice1

    click element   ${SelectCableGroup_Xpath}

    click element   ${NewSpliceSaveBtn_Xpath}

    page should contain  Data Added Successfully.


# This is a testcase to Edit Splice
EditSplice

    SplicePage
    set selenium implicit wait  ${timer}

    click element   ${SelectSpliceCheckbox_Xpath}

    click element   ${EditSplice_Btn_Xpath}

    input text  id:spliceName  Splice1

    click element   ${EditSpliceSaveBtn_Xpath}

    wait until page contains  Data Added Successfully.

# This is a testcase to create copy of Splice
CopySplice

    SplicePage
    set selenium implicit wait  ${timer}

    sleep   1

    click element   ${SelectSpliceCheckbox_Xpath}

    click element   ${CopySplice_Btn_Xpath}

    input text  id:txtNewSpliceName  Splice2

    click element   ${CopySpliceSaveBtn_Xpath}

    wait until page contains    Data Added Successfully.


# This is a testcase to delete selected Splice
DeleteSplice

    SplicePage
    set selenium implicit wait  ${timer}

    sleep   1

    click element   ${SelectSpliceCheckbox_Xpath}

    click element   ${DeleteSplice_Btn_Xpath}

    click element   ${ConfirmDeleteSpliceBtn_Xpath}

    wait until page contains  Deleted Successfully.
