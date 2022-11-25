*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_usermanager.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window

*** Keywords ***

# This is a keyword define to navigate to User Manager Page
UserManagerPage
    click element   ${UserManagerMenu_Xpath}

*** Test Cases ***

# This is a testcase to verify the Local User Header
LocalUsersHeader

    UserManagerPage
    set selenium implicit wait  ${timer}

    page should contain  Local Users

     ${get_text}  Get WebElements  ${LocalUserHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END




# This is a testcase to create new User
CreateNewUser

    UserManagerPage
    set selenium implicit wait  ${timer}

    click element  ${CreateNewUser_Btn_Xpath}

    input text  id:userName  Dheeraj
    input text  id:password  dheerajbhai123
    input text  id:shift    1

    click element   ${SelectAccessLevel_Xpath}

    click element  ${NewUserSave_Btn_Xpath}

    page should contain  Updated Successfully.


# this is a tescase to verify the User properties
UserProperties

    UserManagerPage
    set selenium implicit wait  ${timer}

    click element  ${SelectUser_Xpath}

    ${get_text}  Get WebElements    ${UserProperties_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END


# This is a testcase to Edit User
EditUser

    UserManagerPage
    set selenium implicit wait  ${timer}

    sleep   1

    click element   ${SelectUser_Xpath}

    click element   ${ClickUserManagerEditBtn_Xpath}

    input text  id:userName  DJ
    input text  id:password  dheerubhai321
    input text  id:shift    2

    sleep   1

    click element   ${EditAccessLevel_Xpath}

    click element   ${EditUserSave_Btn_Xpath}

    page should contain  Updated Successfully.


# This is a testcase to Delete User
DeleteUser

    UserManagerPage
    set selenium implicit wait  ${timer}

    click element   ${SelectUser_Xpath}

    click element   ${ClickDelete_Btn_Xpath}

    click element   ${ConfirmDelete_Btn_Xpath}

    page should contain  Deleted Successfully.
