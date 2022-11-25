*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_role.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window

*** Keywords ***

# This is a keyword define to navigate to Role Page
RolePage

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
r

# This is a testcase to verify the Access Section Header
AccessSectionHeader

    RolePage
    set selenium implicit wait  ${timer}

    page should contain  Access Section

     ${get_text}  Get WebElements  ${AccessSectionHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END



# This is a testcase to verify the Access Section Menu elements
AccessSection

    RolePage
    set selenium implicit wait  ${timer}

     ${get_text}  Get WebElements  ${AccessSectionData_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END



# This is a testcase to verify the Role header
RoleTableElements

    RolePage
    set selenium implicit wait  ${timer}

     ${get_text}  Get WebElements  ${RoleTableData_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END


# This is a testcase to create new Role
CreateNewRole

    RolePage
    set selenium implicit wait  ${timer}

    click element  ${CreateNewRole_Btn_Xpath}

    input text  id:roleName  QA

    click element   ${NewRoleSave_Btn_Xpath}

    page should contain  Updated Successfully.


# This is a testcase to Edit Role
EditRole

    RolePage
    set selenium implicit wait  ${timer}

    click element   ${SelectedRole_Xpath}

    click element   ${EditRole_Btn_Xpath}

    input text  id:roleName  QualityAnalyst

    click element   ${EditRoleSave_Btn_Xpath}

    page should contain  Updated Successfully.


# This is a testcase to delete Role
DeleteRole

    RolePage
    set selenium implicit wait  ${timer}

    click element   ${SelectedRole_Xpath}

    click element   ${ClickDeleteRole_Btn_Xpath}

    click element   ${ConfirmDeleteRole_Btn_Xpath}

    page should contain  Deleted Successfully.

