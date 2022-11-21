*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${VariantExplorerTab_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[2]/div/ul/li[5]/a
${VariantProjectPathHeader_Xpath}  xpath://*[@id="selespanProj"]
${NewVariant_Btn_Xpath}    xpath://*[@id="bntGoToCreateVariant"]
${NewVariantSaveBtn_Xpath}    xpath://*[@id="btn-VarSave"]
${SelectVariantcheckbox_Xpath}  xpath://*[@id="tblVariant"]/tbody/tr/td[1]/label/span
${VariantEdit_Btn_Xpath}  xpath://*[@id="btn-VarEdit"]
${VariantEdit_SaveBtn_Xpath}  xpath://*[@id="btn-VarSave"]
${VariantCopy_Btn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[2]/div[2]/div[1]/div/div[1]/div[2]/button[3]
${VariantCopy_SaveBtn_Xpath}  xpath://*[@id="btn-saveas-variant"]
${VariantDelete_Btn_Xpath}    xpath://*[@id="btn-Vardelete"]
${VariantConfirmDelete_Btn_Xpath}  xpath://*[@id="btn-delete-variant"]

*** Keywords ***

# This is a Keyword that navigates to Variant Explorer Page
variantPage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

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

    close browser

# This is a testcase to create new Variant
CreateNewVariant

    variantPage
    set selenium implicit wait  ${timer}

    click element   ${NewVariant_Btn_Xpath}

    input text  id:varName  Variant1
    input text  id:varDesc  This is the first variant under test

    click element   ${NewVariantSaveBtn_Xpath}

    page should contain  Data Added Successfully.
    close browser

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
    close browser

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
    close browser

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