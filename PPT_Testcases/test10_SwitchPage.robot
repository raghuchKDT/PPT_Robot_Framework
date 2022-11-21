*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${SwitchPage_Xpath}  xpath://*[@id="pills-switch-tab"]
${SwitchPathHeader_Xpath}  xpath://*[@id="selespanProj"]
${CreateNewSwitchBtn_Xpath}   xpath://*[@id="bntGoToCreateSwicth"]
${SwitchSaveBtn_Xpath}  xpath://*[@id="btn-switchSave"]
${SelectSwitch_Xpath}   xpath://*[@id="tblswitch"]/tbody/tr/td[1]/label/span
${EditSwitchBtn_Xpath}  xpath://*[@id="btn-switchEdit"]
${EditedSwitchSaveBtn_Xpath}  xpath://*[@id="btn-switchSave"]
${CopySwitchBtn_Xpath}  xpath://*[@id="btn-SwitchSaveAs"]
${CpySwitchSaveasBtn_Xpath}  xpath://*[@id="btn-saveas-switch"]
${SwitchDeleteBtn_Xpath}    xpath://*[@id="btn-switchdelete"]
${SwitchConfirmDeleteBtn_Xpath}  xpath://*[@id="btn-delete-switch"]


*** Keywords ***

# This is a keyword defined to navigate to Switch page
SwitchPage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234
    click element   ${signinbutton_Xpath}

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

    close browser

# this is a testcase to create New Switch
CreateNewSwitch

    SwitchPage
    set selenium implicit wait  ${timer}

    click element   ${CreateNewSwitchBtn_Xpath}

    input text  id:switchGroup  TestSwitch1

    click element   ${SwitchSaveBtn_Xpath}

    page should contain  Updated Successfully.
    close browser

# this is a testcase to Edit Switch
EditSwitch

    SwitchPage
    set selenium implicit wait  ${timer}

    click element   ${SelectSwitch_Xpath}

    click element   ${EditSwitchBtn_Xpath}

    input text  id:switchGroup  Switch1

    click element   ${EditedSwitchSaveBtn_Xpath}

    page should contain  Updated Successfully.
    close browser

# this is a testcase to create a duplicate of Switch
CopySwitch

    SwitchPage
    set selenium implicit wait  ${timer}

    click element   ${SelectSwitch_Xpath}

    click element   ${CopySwitchBtn_Xpath}

    input text  id:txtNewSwitchName  Switch2

    click element   ${CpySwitchSaveasBtn_Xpath}

    page should contain  Data Added Successfully.
    close browser


# This is a testcase to delete the Switch
DeleteSwitch

    SwitchPage
    set selenium implicit wait  ${timer}

    click element   ${SelectSwitch_Xpath}

    click element   ${SwitchDeleteBtn_Xpath}

    click element   ${SwitchConfirmDeleteBtn_Xpath}

    page should contain  Deleted Successfully.
    close browser
