*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${VariantExplorerTab_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[2]/div/ul/li[5]/a
${VariantVariableTab_Xpath}   xpath://*[@id="pills-variantglobalvar-tab"]
${VariantVariableHeader_Xpath}  xpath://*[@id="selespanProj"]
${SelectVariantVariablecheckbox_Xpath}  xpath://*[@id="tblVariantGlobalVar"]/tbody/tr[1]/td[1]/label/span
${VariantVariableEdit_Btn_Xpath}  xpath://*[@id="btn-VariableEdit"]
${SelectCountPassFromList_Xpath}  xpath://*[@id="noFormat-1"]/option[5]
${VariantVariableEdit_SaveBtn_Xpath}  xpath://*[@id="btn-VariableSave"]


*** Keywords ***

# This is a Keyword that navigates to Variant Variable Page
VariantVariablePage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

    click element   ${ProjectMenu_Xpath}

    click element   ${VariantExplorerTab_Xpath}

    click element   ${VariantVariableTab_Xpath}

*** Test Cases ***

# This is a testcase to verify the project path to Variant Variable page
VariantVariablePageHeader

    VariantVariablePage
    set selenium implicit wait  ${timer}

     ${get_text}  Get WebElements  ${VariantVariableHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a testcase to Edit Connection List
EditVariantVariable

    VariantVariablePage
    set selenium implicit wait  ${timer}

    sleep   1

    click element   ${SelectVariantVariablecheckbox_Xpath}

    click element   ${VariantVariableEdit_Btn_Xpath}

    click element   ${SelectCountPassFromList_Xpath}

    click element   ${VariantVariableEdit_SaveBtn_Xpath}

#    wait until page contains  Updated successfully.
    close browser
