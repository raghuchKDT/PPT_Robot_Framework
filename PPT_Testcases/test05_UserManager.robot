*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${UserManagerMenu_Xpath}    xpath://*[@id="four"]
${LocalUserHeader_Xpath}  xpath://*[@id="pills-user"]/div/div/div[1]/div[1]/div[1]/h6
${CreateNewUser_Btn_Xpath}   xpath://*[@id="bntGoToCreateUser"]
${SelectAccessLevel_Xpath}  xpath://*[@id="roleId"]/option[3]
${NewUserSave_Btn_Xpath}    xpath://*[@id="btn-userSave"]
${SelectUser_Xpath}  xpath://*[@id="tblUser"]/tbody/tr/td[1]/label/span
${UserProperties_Xpath}  xpath://*[@id="accordion"]/div
${ClickUserManagerEditBtn_Xpath}    xpath://*[@id="btn-userEdit"]
${EditAccessLevel_Xpath}    xpath://*[@id="editroleId"]/option[2]
${EditUserSave_Btn_Xpath}    xpath://*[@id="btn-userSave"]
${ClickDelete_Btn_Xpath}    xpath://*[@id="btn-userdelete"]
${ConfirmDelete_Btn_Xpath}    xpath://*[@id="btn-delete-user"]

*** Keywords ***

# This is a keyword define to navigate to User Manager Page
UserManagerPage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234
    click element   ${signinbutton_Xpath}

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

    close browser


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

    close browser

# this is a tescase to verify the User properties
UserProperties

    UserManagerPage
    set selenium implicit wait  ${timer}

    click element  ${SelectUser_Xpath}

    ${get_text}  Get WebElements    ${UserProperties_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

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

    close browser

# This is a testcase to Delete User
DeleteUser

    UserManagerPage
    set selenium implicit wait  ${timer}

    click element   ${SelectUser_Xpath}

    click element   ${ClickDelete_Btn_Xpath}

    click element   ${ConfirmDelete_Btn_Xpath}

    page should contain  Deleted Successfully.

    close browser
