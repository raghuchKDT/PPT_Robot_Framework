*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_Module.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window



*** Keywords ***

# This is a keyword define to navigate to Module Page
ModulePage
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


# This is a testcase to delete selected module
ModuleDelete

    ModulePage
    set selenium implicit wait  ${timer}

    click element   ${SelectModule_Xpath}

    click element   ${ModuleDeleteBtn_Xpath}

    click element   ${ModuleConfirmDeleteBtn_Xpath}

    page should contain  Module deleted successfully
