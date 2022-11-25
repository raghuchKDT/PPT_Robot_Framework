*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_variant.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window

*** Keywords ***

# This is a Keyword that navigates to Variant Explorer Page
variantPage

    click element   ${ProjectMenu_Xpath}

    click element   ${VariantExplorerTab_Xpath}

*** Test Cases ***

# This is a testcase to verify the project path to Variant Explorer page
VariantPageHeader

    variantPage
    set selenium implicit wait  ${timer}

     ${get_text}  Get WebElements  ${VariantProjectPathHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END


# This is a testcase to create new Variant
CreateNewVariant

    variantPage
    set selenium implicit wait  ${timer}

    click element   ${NewVariant_Btn_Xpath}

    input text  id:varName  Variant1
    input text  id:varDesc  This is the first variant under test

    click element   ${NewVariantSaveBtn_Xpath}

    page should contain  Data Added Successfully.


# This is a testcase to Edit Variant
EditVariant

    variantPage
    set selenium implicit wait  ${timer}

#    click element   ${SelectVariantcheckbox_Xpath}

    click element   ${VariantEdit_Btn_Xpath}

    input text  id:varName  TestVariant1
    input text  id:varDesc  This is edited label under test

    click element   ${VariantEdit_SaveBtn_Xpath}

    wait until page contains  Data Added Successfully.


# This is a testcase to create copy of a Variant
CopyVariant

    variantPage
    set selenium implicit wait  ${timer}

    click element   ${SelectVariantcheckbox_Xpath}
    sleep   1

    click element   ${VariantCopy_Btn_Xpath}

    input text  id:txtNewVariantName  Variant2

    click element   ${VariantCopy_SaveBtn_Xpath}

    sleep   1

    wait until page contains    Data Added Successfully.


# This is a testcase to delete selected variant
#DeleteVariant
#
#    variantPage
#    set selenium implicit wait  ${timer}
#
##    click element   ${SelectVariantcheckbox_Xpath}
#
#    click element   ${VariantDelete_Btn_Xpath}
#
#    click element   ${VariantConfirmDelete_Btn_Xpath}
#
#    sleep   1
#
#    wait until page contains  Deleted Successfully.
#    close browser