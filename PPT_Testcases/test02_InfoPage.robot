*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_Info.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window



*** Test Cases ***

# This is a testcase to verify the title of the Home page of PPT Machine
InfoPageTitle

    set selenium implicit wait  ${timer}
    title should be    komax Testing


# This is a testcase to verify the Recent Project header
RecentProjHeader


    set selenium implicit wait  ${timer}
    sleep  2s
    click element   ${RecentProjectHeader_Xpath}

    page should contain  Projects

     ${get_text}  Get WebElements  ${RecentProjectsData_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END



# This is a test to verify the Version History details
VersionHistory



    sleep   2s

    click element  ${VersionHistoryTab_Xpath}

    ${get_text}  Get WebElements  ${VersionHistoryData_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END



# This is a test to verify the Option details
OptionTab


    set selenium implicit wait  ${timer}

    click element   ${OptionsTab_Xpath}

    page should contain  Software options installed

    ${get_text}  Get WebElements  ${OptionsTabData_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END
