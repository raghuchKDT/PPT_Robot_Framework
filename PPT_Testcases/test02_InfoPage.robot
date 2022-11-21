*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${RecentProjectHeader_Xpath}    xpath://*[@id="pills-home"]/div[1]/h6
${RecentProjectsData_Xpath}    xpath://*[@id="tblProject_wrapper"]/div[2]/div
${VersionHistoryTab_Xpath}  xpath://*[@id="pills-profile-tab"]
${VersionHistoryData_Xpath}   xpath:/html/body/div/div[2]/main/div[4]/div/div/div
${OptionsTab_Xpath}  xpath://*[@id="pills-contact-tab"]
${OptionsTabData_Xpath}   xpath:/html/body/div/div[2]/main/div[4]/div/div/div

*** Keywords ***

# This is a keyword to navigate to Info Page
InfoPage
    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

*** Test Cases ***

# This is a testcase to verify the title of the Home page of PPT Machine
InfoPageTitle

    InfoPage
    set selenium implicit wait  ${timer}
    title should be    komax Testing

    close browser

# This is a testcase to verify the Recent Project header
RecentProjHeader

    InfoPage
    set selenium implicit wait  ${timer}

    click element   ${RecentProjectHeader_Xpath}

    page should contain  Projects

     ${get_text}  Get WebElements  ${RecentProjectsData_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a test to verify the Version History details
VersionHistory

    InfoPage
    set selenium implicit wait  ${timer}

    click element  ${VersionHistoryTab_Xpath}

    ${get_text}  Get WebElements  ${VersionHistoryData_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a test to verify the Option details
OptionTab

    InfoPage
    set selenium implicit wait  ${timer}

    click element   ${OptionsTab_Xpath}

    page should contain  Software options installed

    ${get_text}  Get WebElements  ${OptionsTabData_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser