*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${UserManagerMenu_Xpath}    xpath://*[@id="four"]
${RoleTab_Xpath}    xpath://*[@id="pills-device-tab"]
${AccessLevelHeader_Xpath}  xpath://*[@id="pills-device"]/div/div[2]/h6
${AccessSectionHeader_Xpath}  xpath://*[@id="pills-device"]/div/div[3]/h6
${AccessSectionData_Xpath}    xpath://*[@id="accordion"]/div
${RoleTableData_Xpath}  xpath://*[@id="tblRole_wrapper"]/div[1]
${SelectedRole_Xpath}   xpath://*[@id="tblRole"]/tbody/tr[3]/td[1]/label/span
${CreateNewRole_Btn_Xpath}  xpath://*[@id="bntGoToCreateRole"]
${NewRoleSave_Btn_Xpath}  xpath://*[@id="btn-roleSave"]
${EditRole_Btn_Xpath}   xpath://*[@id="btn-roleEdit"]
${EditRoleSave_Btn_Xpath}    xpath://*[@id="btn-roleSave"]
${ClickDeleteRole_Btn_Xpath}   xpath://*[@id="btn-roledelete"]
${ConfirmDeleteRole_Btn_Xpath}  xpath://*[@id="btn-delete-role"]

*** Keywords ***

# This is a keyword define to navigate to Role Page
RolePage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

    click element  ${UserManagerMenu_Xpath}

    click element   ${RoleTab_Xpath}

*** Test Cases ***

# This is a testcase to verify the Access Level Header
AccessLevelHeader

    RolePage
    set selenium implicit wait  ${timer}

    page should contain  Access Level

     ${get_text}  Get WebElements  ${AccessLevelHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a testcase to verify the Access Section Header
AccessSectionHeader

    RolePage
    set selenium implicit wait  ${timer}

    page should contain  Access Section

     ${get_text}  Get WebElements  ${AccessSectionHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a testcase to verify the Access Section Menu elements
AccessSection

    RolePage
    set selenium implicit wait  ${timer}

     ${get_text}  Get WebElements  ${AccessSectionData_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a testcase to verify the Role header
RoleTableElements

    RolePage
    set selenium implicit wait  ${timer}

     ${get_text}  Get WebElements  ${RoleTableData_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END
    close browser

# This is a testcase to create new Role
CreateNewRole

    RolePage
    set selenium implicit wait  ${timer}

    click element  ${CreateNewRole_Btn_Xpath}

    input text  id:roleName  QA

    click element   ${NewRoleSave_Btn_Xpath}

    page should contain  Updated Successfully.
    close browser

# This is a testcase to Edit Role
EditRole

    RolePage
    set selenium implicit wait  ${timer}

    click element   ${SelectedRole_Xpath}

    click element   ${EditRole_Btn_Xpath}

    input text  id:roleName  QualityAnalyst

    click element   ${EditRoleSave_Btn_Xpath}

    page should contain  Updated Successfully.
    close browser

# This is a testcase to delete Role
DeleteRole

    RolePage
    set selenium implicit wait  ${timer}

    click element   ${SelectedRole_Xpath}

    click element   ${ClickDeleteRole_Btn_Xpath}

    click element   ${ConfirmDeleteRole_Btn_Xpath}

    page should contain  Deleted Successfully.
    close browser
