*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${VariantExplorerTab_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[2]/div/ul/li[5]/a
${SpliceTab_Xpath}   xpath://*[@id="pills-splice-tab"]
${SplicePathHeader_Xpath}  xpath://*[@id="selespanProj"]
${NewSplice_Btn_Xpath}    xpath://*[@id="bntGoToCreateSplice"]
${SelectCableGroup_Xpath}   xpath://*[@id="spliceType"]/option[2]
${NewSpliceSaveBtn_Xpath}    xpath://*[@id="btn-spliceSave"]
${SelectSpliceCheckbox_Xpath}   xpath://*[@id="tblSplice"]/tbody/tr[1]/td[1]/label/span
${EditSplice_Btn_Xpath}  xpath://*[@id="btn-spliceEdit"]
${EditSpliceSaveBtn_Xpath}  xpath://*[@id="btn-spliceSave"]
${CopySplice_Btn_Xpath}  xpath://*[@id="btn-SpliceSaveAs"]
${CopySpliceSaveBtn_Xpath}  xpath://*[@id="btn-saveas-splice"]
${DeleteSplice_Btn_Xpath}   xpath://*[@id="btn-splicedelete"]
${ConfirmDeleteSpliceBtn_Xpath}  xpath://*[@id="btn-delete-splice"]

*** Keywords ***

# This is a Keyword that navigates to Splice Page
SplicePage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

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

    close browser

# This is a testcase to create new Splice
CreateNewSplice

    SplicePage
    set selenium implicit wait  ${timer}

    click element   ${NewSplice_Btn_Xpath}

    input text  id:spliceName  TestSplice1

    click element   ${SelectCableGroup_Xpath}

    click element   ${NewSpliceSaveBtn_Xpath}

    page should contain  Data Added Successfully.
    close browser

# This is a testcase to Edit Splice
EditSplice

    SplicePage
    set selenium implicit wait  ${timer}

    click element   ${SelectSpliceCheckbox_Xpath}

    click element   ${EditSplice_Btn_Xpath}

    input text  id:spliceName  Splice1

    click element   ${EditSpliceSaveBtn_Xpath}

    wait until page contains  Data Added Successfully.
    close browser

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
    close browser

# This is a testcase to delete selected Splice
DeleteSplice

    SplicePage
    set selenium implicit wait  ${timer}

    sleep   1

    click element   ${SelectSpliceCheckbox_Xpath}

    click element   ${DeleteSplice_Btn_Xpath}

    click element   ${ConfirmDeleteSpliceBtn_Xpath}

    wait until page contains  Deleted Successfully.
    close browser