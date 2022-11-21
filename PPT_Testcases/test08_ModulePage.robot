*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${ModulePage_Xpath}  xpath://*[@id="pills-device-tab"]
${ProjectModuleHeader_Xpath}  xpath://*[@id="selespanProj"]
${NewModuleBtn_Xpath}   xpath://*[@id="deChk2"]/div[2]/div/button[1]
${ModuleSaveBtn_Xpath}  xpath://*[@id="btn-add-module"]
${SelectModule_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[3]/div/div/div[1]/span[1]/div/ul/li/a/h6
${EditModuleBtn_Xpath}  xpath://*[@id="deChk2"]/div[2]/div/button[2]
${EditedModuleSaveBtn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[10]/div/div/div[2]/div/button[2]
${CopyModuleBtn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[3]/div/div/div[1]/div[2]/div/button[3]
${CpyModuleSaveasBtn_Xpath}  xpath://*[@id="btn-copy-module"]
${ModuleDeleteBtn_Xpath}    xpath://*[@id="btn-DeleteModule"]
${ModuleConfirmDeleteBtn_Xpath}  xpath://*[@id="btn-delete-module"]

*** Keywords ***

# This is a keyword define to navigate to Module Page
ModulePage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

    click element   ${ProjectMenu_Xpath}

    click element   ${ModulePage_Xpath}

*** Test Cases ***

# this is a testcase to verify the header of the Project Module path
ProjectModulePath

    ModulePage
    set selenium implicit wait  ${timer}

    ${get_text}  Get WebElements  ${ProjectModuleHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END
    close browser

# this is a testcase to create New Module
CreateNewModule

    ModulePage
    set selenium implicit wait  ${timer}

    click element   ${NewModuleBtn_Xpath}

    input text  id:txtNewModule  TestModule1
    input text  id:txtModuleDescription     This is the module under test
    input text  id:txtCavity    20
    input text  id:txtSwitch    2
    input text  id:txtCavityLed  20

    Choose File  id:modImg  C://Users//KnoDTec - Dheeraj//Downloads//Xcode_Module_img.png

    click element   ${ModuleSaveBtn_Xpath}

    page should contain  Module Added successfully.
    close browser

# this is a testcase to Edit the Module
EditModule

    ModulePage
    set selenium implicit wait  ${timer}

#    click element   ${SelectModule_Xpath}

    click element   ${EditModuleBtn_Xpath}

    input text  id:txtNewModule1  TestModule1001
    input text  id:txtModuleDescription1     This is the edited module under test
    input text  id:txtCavity1    13
    input text  id:txtSwitch1    0
    input text  id:txtCavityLed1  13

#    Choose File  id:modImg1  C://Users//KnoDTec - Dheeraj//Downloads//OCUA.png

    click element   ${EditedModuleSaveBtn_Xpath}

    page should contain  Module Updated successfully.
    close browser

# this is a testcase to create duplicate of the Module
CopyModule

    ModulePage
    set selenium implicit wait  ${timer}

#    click element   ${SelectModule_Xpath}

    click element   ${CopyModuleBtn_Xpath}

    input text  id:txtCopyNewModule  Module3
    input text  id:txtCopyModuleDescription     This is the duplicate module under test

    click element   ${CpyModuleSaveasBtn_Xpath}

    page should contain  Module Added successfully.
    close browser

# This is a testcase to delete selected module
ModuleDelete

    ModulePage
    set selenium implicit wait  ${timer}

    click element   ${SelectModule_Xpath}

    click element   ${ModuleDeleteBtn_Xpath}

    click element   ${ModuleConfirmDeleteBtn_Xpath}

    page should contain  Module deleted successfully
    close browser