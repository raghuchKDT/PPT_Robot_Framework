*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${VariantExplorerTab_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[2]/div/ul/li[5]/a
${ConnectionListTab_Xpath}   xpath://*[@id="pills-connectionlist-tab"]
${ConnectionListHeader_Xpath}  xpath://*[@id="pills-connectionlist"]/div[1]/a
${NewConnectionList_Btn_Xpath}    xpath://*[@id="bntCreateConnectionListDetail"]
${NewConnectionListSaveBtn_Xpath}    xpath://*[@id="btn-add-connectionDet"]
${SelectConnectionListcheckbox_Xpath}    xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[2]/div[2]/div[5]/div[1]/div[2]/div/div[2]/div[2]/div/div[1]/div/label/span
${ConnectionListEdit_Btn_Xpath}  xpath://*[@id="bntEditConnectionListDetail"]
${ConnectionListEdit_UpdateBtn_Xpath}  xpath://*[@id="btn-update-connectionDet"]
${ConnectionListCopy_Btn_Xpath}  xpath://*[@id="btn-conndetails-copy"]
${ConnectionListCopy_SaveAsBtn_Xpath}  xpath://*[@id="btn-copy-connection"]
${ConnectionListDelete_Btn_Xpath}    xpath://*[@id="btn-connectionlistDetaildelete"]
${ConnectionListConfirmDelete_Btn_Xpath}  xpath://*[@id="btn-delete-connectionlist"]
${ConnectionListNameHeader_Xpath}   xpath://*[@id="pills-connectionlist"]/div[1]/div[3]/div[1]/label

*** Keywords ***

# This is a Keyword that navigates to Connection List Page
ConnectionListPage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

    click element   ${ProjectMenu_Xpath}

    click element   ${VariantExplorerTab_Xpath}

    click element   ${ConnectionListTab_Xpath}

*** Test Cases ***

# This is a testcase to verify the project path to Connection List page
ConnectionListPageHeader

    ConnectionListPage
    set selenium implicit wait  ${timer}

     ${get_text}  Get WebElements  ${ConnectionListHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a testcase to create new Connection List
CreateNewConnectionList

    ConnectionListPage
    set selenium implicit wait  ${timer}

    click element   ${NewConnectionList_Btn_Xpath}

    input text  id:txtNewConnectionListName  TestConnectionList1
    input text  id:txtNewConnectionListDescription  This is the first connection list under test

    click element   ${NewConnectionListSaveBtn_Xpath}

    page should contain  Connection List Details Added successfully.
    close browser

# This is a testcase to Edit Connection List
EditConnectionList

    ConnectionListPage
    set selenium implicit wait  ${timer}

    click element   ${SelectConnectionListcheckbox_Xpath}

    click element   ${ConnectionListEdit_Btn_Xpath}

    input text  id:txtNewConnectionListName  ConnectionList1
    input text  id:txtNewConnectionListDescription  This is edited Connection List under test

    click element   ${ConnectionListEdit_UpdateBtn_Xpath}

    wait until page contains  Connection List Details Updated successfully.
    close browser

# This is a testcase to create copy of Connection List
CopyConnectionList

    ConnectionListPage
    set selenium implicit wait  ${timer}

    sleep   1

    click element   ${SelectConnectionListcheckbox_Xpath}

    click element   ${ConnectionListCopy_Btn_Xpath}

    input text  id:txtCopyNewConnectionName  ConnectionList2
    input text  id:txtCopyNewConnectionListDescription  This is a duplicate copy of Connection List

    click element   ${ConnectionListCopy_SaveAsBtn_Xpath}

    wait until page contains    Connection List Details Added successfully.
    close browser

# This is a testcase to delete selected Connection list
DeleteConnectionList

    ConnectionListPage
    set selenium implicit wait  ${timer}

    click element   ${SelectConnectionListcheckbox_Xpath}

    click element   ${ConnectionListDelete_Btn_Xpath}

    click element   ${ConnectionListConfirmDelete_Btn_Xpath}

    wait until page contains  Deleted Successfully.
    close browser

