*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${LabelTab_Xpath}   xpath://*[@id="pills-label-tab"]
${ProjectLabelPathHeader_Xpath}  xpath://*[@id="selespanProj"]
${NewLabel_Btn_Xpath}    xpath://*[@id="bntGoToCreateLabel"]
${NewLabelSaveBtn_Xpath}    xpath://*[@id="btn-labelSave"]
${SelectLabelcheckbox_Xpath}    xpath://*[@id="tblLabel"]/tbody/tr/td[1]/label/span
${LabelEdit_Btn_Xpath}  xpath://*[@id="btn-LabelEdit"]
${LabelEdit_SaveBtn_Xpath}  xpath://*[@id="btn-labelSave"]
${LabelCopy_Btn_Xpath}  xpath://*[@id="btn-LabelSaveAs"]
${LabelCopy_SaveBtn_Xpath}  xpath://*[@id="btn-saveas-label"]
${LabelDelete_Btn_Xpath}    xpath://*[@id="btn-labeldelete"]
${LabelConfirmDelete_Btn_Xpath}  xpath://*[@id="btn-delete-label"]

*** Keywords ***

# This is a Keyword that navigates to Label Page
LabelPage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

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

    close browser


# This is a testcase to create new Label
CreateNewLabel

    LabelPage
    set selenium implicit wait  ${timer}

    click element   ${NewLabel_Btn_Xpath}

    input text  id:labelName  TestLabel1
    input text  id:reportDescription  This is a label under test

    click element   ${NewLabelSaveBtn_Xpath}

    wait until page contains  Updated Successfully.

    close browser

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

    close browser

# This is a testcase to create copy of a Label
CopyLabel

    LabelPage
    set selenium implicit wait  ${timer}

    click element   ${SelectLabelcheckbox_Xpath}

    click element   ${LabelCopy_Btn_Xpath}

    input text  id:txtNewLabelName  Label2

    click element   ${LabelCopy_SaveBtn_Xpath}

    wait until page contains    Data Added Successfully.

    close browser

# This is a testcase to delete Label
DeleteLabel

    LabelPage
    set selenium implicit wait  ${timer}

    sleep   1

    click element   ${SelectLabelcheckbox_Xpath}

    click element   ${LabelDelete_Btn_Xpath}

    click element   ${LabelConfirmDelete_Btn_Xpath}

    wait until page contains  Deleted Successfully.

    close browser