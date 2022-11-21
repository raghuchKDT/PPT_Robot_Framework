*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${pickToLightPage_Xpath}  xpath://*[@id="pills-tab"]/li[3]/a
${PickToLightPathHeader_Xpath}  xpath://*[@id="selespanProj"]
${CreateNewPTLBtn_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[4]/div/div/div[1]/div[2]/div/button[1]
${PTLSaveBtn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[4]/div/div/div[2]/div/button[2]
${SelectPTL_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[4]/div/div/div[1]/span[1]/div/ul/li/a/h6
${EditPTLBtn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[4]/div/div/div[1]/div[2]/div/button[2]
${EditedPTLSaveBtn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[6]/div/div/div[2]/div/button[2]
${CopyPTLBtn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[4]/div/div/div[1]/div[2]/div/button[3]
${CpyPTLSaveasBtn_Xpath}  xpath://*[@id="btn-copy-pickToLight"]
${PTLDeleteBtn_Xpath}    xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[4]/div/div/div[1]/div[2]/div/button[4]
${PTLConfirmDeleteBtn_Xpath}  xpath://*[@id="btn-delete-picktoligt"]


*** Keywords ***

# This is a keyword defined to navigate to Pick To Light page
PTLPage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234
    click element   ${signinbutton_Xpath}

    click element   ${ProjectMenu_Xpath}

    click element   ${pickToLightPage_Xpath}

*** Test Cases ***

# this is a testcase to verify the header of the Project Pick To Light path
ProjectPTLPath

    PTLPage
    set selenium implicit wait  ${timer}

    ${get_text}  Get WebElements  ${PickToLightPathHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# this is a testcase to create New Pick To Light
CreateNewPTL

    PTLPage
    set selenium implicit wait  ${timer}

    click element   ${CreateNewPTLBtn_Xpath}

    input text  id:txtNewPickToLight  TestPTL1
    input text  id:txtPickToLightDescription     This is the Pick To Light under test
    input text  id:txtLightLed    20

    click element   ${PTLSaveBtn_Xpath}

    page should contain  Pick To Light Added successfully.
    close browser

# this is a testcase to Edit Pick To Light
EditPTL

    PTLPage
    set selenium implicit wait  ${timer}

#    click element   ${SelectPTL_Xpath}

    click element   ${EditPTLBtn_Xpath}

    input text  id:txtPickName  PTLTest1

    sleep   1

    input text  id:txtPickDesc     This is the edited Pick To Light under test

    sleep   1

    input text  id:txtPickNum    15

    click element   ${EditedPTLSaveBtn_Xpath}

    sleep   1

    page should contain  Pick To Light Updated successfully.

    close browser

# This is a testcase to create a duplicate copy of Pick To Light
CopyPTL

    PTLPage
    set selenium implicit wait  ${timer}

#    click element   ${SelectPTL_Xpath}

    click element   ${CopyPTLBtn_Xpath}

    input text  id:txtCopyNewPickToLight  PTL2
    input text  id:txtCopyPickToLightDescription  This is duplicate Pick To Light under test

    click element   ${CpyPTLSaveasBtn_Xpath}

    page should contain  Added Successfully.
    close browser

# This is a testcase to delete the selected Pick To Light
DeletePTL

    PTLPage
    set selenium implicit wait  ${timer}

    click element   ${SelectPTL_Xpath}

    click element   ${PTLDeleteBtn_Xpath}

    click element   ${PTLConfirmDeleteBtn_Xpath}

    page should contain  Pick To Light Deleted successfully.
    close browser