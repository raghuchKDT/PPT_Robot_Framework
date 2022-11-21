*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${ProjectHeader_Xpath}  xpath://*[@id="pills-home"]/div/div[1]/h6
${CreateNewProject_Btn_Xpath}   xpath://*[@id="bntGoToCreateProject"]
${SelectPopUpTimer_xpath}   xpath://*[@id="popupTimer"]/option[6]
${ClickDeviceManager_xpath}  xpath://*[@id="headingTwo"]/h6/a
${NewProjectSelectSystemGroup_Xpath}    xpath://*[@id="systemGroup"]/option[3]
${NewProjectSave_Btn_Xpath}  xpath://*[@id="btn-Save"]
${ProjectProperties_Xpath}  xpath://*[@id="accordion"]/div[1]
${SelectProjectCheckbox_Xpath}  xpath://*[@id="tblProject"]/tbody/tr/td[1]/label/span
${EditProject_Btn_Xpath}    xpath://*[@id="btn-Edit"]
${EditProjectSelectSystemGroup_Xpath}   xpath://*[@id="systemGroup"]/option[2]
${EditedProjectSave_Btn_Xpath}   xpath://*[@id="btn-Save"]
${CopyProject_Btn_Xpath}    xpath://*[@id="btn-SaveAs"]
${CopyProjectSave_Btn_Xpath}    xpath://*[@id="btn-saveas-project"]
${Project_DeleteBtn_Xpath}    xpath://*[@id="btn-delete"]
${Project_ConfirmDeleteBtn_Xpath}   xpath://*[@id="btn-delete-project"]

*** Keywords ***

# This is a keyword define to navigate to Settings Project Page
SettingsProjectPage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

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

    close browser

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

    page should contain  Updated Successfully!
    close browser

# This is a testcase to verify the selected project properties
ProjectProperties

    SettingsProjectPage
    set selenium implicit wait  ${timer}

     ${get_text}  Get WebElements   ${ProjectProperties_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

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
    close browser

# This is a testcase to create a duplicate of existing project
CopyProject

    SettingsProjectPage
    set selenium implicit wait  ${timer}

    click element  ${CopyProject_Btn_Xpath}

    input text  id:txtNewProjectName  Project1

    click element   ${CopyProjectSave_Btn_Xpath}

    page should contain  Data Added Successfully.
    close browser

# This a testcase to delete the selected project
DeleteProject

    SettingsProjectPage
    set selenium implicit wait  ${timer}

    click element   ${Project_DeleteBtn_Xpath}

    click element   ${Project_ConfirmDeleteBtn_Xpath}

    page should contain  Deleted Successfully.
    close browser
