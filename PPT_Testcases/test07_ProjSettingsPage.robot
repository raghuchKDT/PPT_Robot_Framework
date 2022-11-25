*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_projsettings.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window


*** Keywords ***

# This is a keyword define to navigate to Settings Project Page
SettingsProjectPage

    click element   ${ProjectMenu_Xpath}

*** Test Cases ***

# This is a testcase to verify the project header
ProjectHeader

    SettingsProjectPage
    set selenium implicit wait  ${timer}

     ${get_text}  Get WebElements  ${ProjectHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END



# This is a testcase to create new Project
CreateNewProject

    SettingsProjectPage
    set selenium implicit wait  ${timer}

    click element   ${CreateNewProject_Btn_Xpath}

    input text  id:ProjName  TestProject_1
    input text  id:Projdesc  This is the first project under test
    input text  id:unfreezepass  admin
    input text  id:facilityName  Project

    click element   ${SelectPopUpTimer_xpath}

#    click element   ${ClickDeviceManager_xpath}

#    click element   ${NewProjectSelectSystemGroup_Xpath}

    click element   ${NewProjectSave_Btn_Xpath}
    sleep     2s
    page should contain  Updated Successfully!


# This is a testcase to verify the selected project properties
ProjectProperties

    SettingsProjectPage
    set selenium implicit wait  ${timer}

     ${get_text}  Get WebElements   ${ProjectProperties_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END



# This is a testcase to edit the Project
EditProject

    SettingsProjectPage
    set selenium implicit wait  ${timer}

    click element   ${EditProject_Btn_Xpath}

    input text  id:ProjName  TestProject1
    input text  id:Projdesc  This is the first edited project under test
    input text  id:unfreezepass  Admin
    input text  id:facilityName  project

    click element   ${SelectPopUpTimer_xpath}

#    click element   ${ClickDeviceManager_xpath}

#    click element   ${EditProjectSelectSystemGroup_Xpath}

    click element   ${EditedProjectSave_Btn_Xpath}

    page should contain  Updated Successfully!


# This is a testcase to create a duplicate of existing project
CopyProject

    SettingsProjectPage
    set selenium implicit wait  ${timer}

    click element  ${CopyProject_Btn_Xpath}

    input text  id:txtNewProjectName  Project1

    click element   ${CopyProjectSave_Btn_Xpath}

    sleep    2s

    page should contain  Data Added Successfully.


# This a testcase to delete the selected project
DeleteProject

    SettingsProjectPage
    set selenium implicit wait  ${timer}

    click element   ${Project_DeleteBtn_Xpath}

    click element   ${Project_ConfirmDeleteBtn_Xpath}

    page should contain  Deleted Successfully.

