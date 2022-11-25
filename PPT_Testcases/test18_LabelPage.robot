*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_label.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window


*** Keywords ***

# This is a Keyword that navigates to Label Page
LabelPage

    click element   ${ProjectMenu_Xpath}

    click element   ${LabelTab_Xpath}

*** Test Cases ***

# This is a testcase to verify the project path to Label page
ProjectLabelPath

    LabelPage
    set selenium implicit wait  ${timer}

    ${get_text}  Get WebElements    ${ProjectLabelPathHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END




# This is a testcase to create new Label
CreateNewLabel

    LabelPage
    set selenium implicit wait  ${timer}

    click element   ${NewLabel_Btn_Xpath}

    input text  id:labelName  TestLabel1
    input text  id:reportDescription  This is a label under test

    click element   ${NewLabelSaveBtn_Xpath}

    wait until page contains  Updated Successfully.


# This is a testcase to Edit Label
EditLabel

    LabelPage
    set selenium implicit wait  ${timer}

    click element   ${SelectLabelcheckbox_Xpath}

    click element   ${LabelEdit_Btn_Xpath}

    input text  id:labelName  Label1
    input text  id:reportDescription  This is edited label under test

    click element   ${LabelEdit_SaveBtn_Xpath}

    wait until page contains  Updated Successfully.


# This is a testcase to create copy of a Label
CopyLabel

    LabelPage
    set selenium implicit wait  ${timer}

    click element   ${SelectLabelcheckbox_Xpath}

    click element   ${LabelCopy_Btn_Xpath}

    input text  id:txtNewLabelName  Label2

    click element   ${LabelCopy_SaveBtn_Xpath}

    wait until page contains    Data Added Successfully.


# This is a testcase to delete Label
DeleteLabel

    LabelPage
    set selenium implicit wait  ${timer}

    sleep   1

    click element   ${SelectLabelcheckbox_Xpath}

    click element   ${LabelDelete_Btn_Xpath}

    click element   ${LabelConfirmDelete_Btn_Xpath}

    wait until page contains  Deleted Successfully.
