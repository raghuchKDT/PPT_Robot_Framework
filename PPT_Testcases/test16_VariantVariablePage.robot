*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_Variantvariable.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window


*** Keywords ***

# This is a Keyword that navigates to Variant Variable Page
VariantVariablePage

    click element   ${ProjectMenu_Xpath}

    click element   ${VariantExplorerTab_Xpath}

    click element   ${VariantVariableTab_Xpath}

*** Test Cases ***

# This is a testcase to verify the project path to Variant Variable page
VariantVariablePageHeader

    VariantVariablePage
    set selenium implicit wait  ${timer}

     ${get_text}  Get WebElements  ${VariantVariableHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END



# This is a testcase to Edit Connection List
EditVariantVariable

    VariantVariablePage
    set selenium implicit wait  ${timer}

    sleep   1

    click element   ${SelectVariantVariablecheckbox_Xpath}

    click element   ${VariantVariableEdit_Btn_Xpath}

    click element   ${SelectCountPassFromList_Xpath}

    click element   ${VariantVariableEdit_SaveBtn_Xpath}

#    wait until page contains  Updated successfully.

