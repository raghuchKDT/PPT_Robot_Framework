*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_connectionlist.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window


*** Keywords ***

# This is a Keyword that navigates to Connection List Page
ConnectionListPage

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



# This is a testcase to create new Connection List
CreateNewConnectionList

    ConnectionListPage
    set selenium implicit wait  ${timer}

    click element   ${NewConnectionList_Btn_Xpath}

    input text  id:txtNewConnectionListName  TestConnectionList1
    input text  id:txtNewConnectionListDescription  This is the first connection list under test

    click element   ${NewConnectionListSaveBtn_Xpath}

    page should contain  Connection List Details Added successfully.


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


# This is a testcase to delete selected Connection list
DeleteConnectionList

    ConnectionListPage
    set selenium implicit wait  ${timer}

    click element   ${SelectConnectionListcheckbox_Xpath}

    click element   ${ConnectionListDelete_Btn_Xpath}

    click element   ${ConnectionListConfirmDelete_Btn_Xpath}

    wait until page contains  Deleted Successfully.

