*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${ModulePage_Xpath}  xpath://*[@id="pills-device-tab"]
${VariantExplorerTab_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[2]/div/ul/li[5]/a
${XcodeTab_Xpath}   xpath://*[@id="pills-xcode-tab"]
${XcodePathHeader_Xpath}  xpath://*[@id="selespanProj"]
${NewXcode_Btn_Xpath}    xpath://*[@id="collapseXcodeParent"]/div[1]/button[1]
${SelectModulefromList_Xpath}   xpath://*[@id="drdXCodeModule"]/option
${NewXcodeSaveBtn_Xpath}    xpath://*[@id="btn-add-xcode"]
${SelectXcodecheckbox_Xpath}    xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[1]/div/div[1]/div[3]/div/div[2]/div/a/div/div[1]
${XcodeEdit_Btn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[1]/div/div[1]/div[1]/button[2]
${XcodeEdit_SaveBtn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[2]/div[2]/div[2]/div[3]/div/div/div[2]/div/button[2]
${XcodePinupdate_btn_xpath}  xpath://*[@id="btnUpdateXCodeAnnotation"]
${Module_Element_Xpath}  xpath://*[@id="collapseSysDescBelow"]/div/div/div/div[6]/div/p
${XcodeCopy_Btn_Xpath}  xpath:/html/body/div/div[2]/main/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[1]/div/div[1]/div[1]/button[3]
${SelectXcodefromList_Xpath}    xpath://*[@id="drdCopyXCode"]/option[2]
${XcodeCopy_SaveBtn_Xpath}  xpath://*[@id="btn-copy-xcode"]
${XcodeDelete_Btn_Xpath}    xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[1]/div/div[1]/div[1]/button[4]
${XcodeConfirmDelete_Btn_Xpath}  xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[4]/div/div/div[2]/div/button[2]
${xcodeCtp_xpath}   xpath://*[@id="ctp-1"]
${ctpName_xpath}  ctp-1

*** Keywords ***

# This is a Keyword that navigates to XcodePage
ModulePage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

    click element   ${ProjectMenu_Xpath}

    click element   ${ModulePage_Xpath}

XcodePage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

    click element   ${ProjectMenu_Xpath}

    click element   ${VariantExplorerTab_Xpath}

    click element  ${XcodeTab_Xpath}

*** Test Cases ***

# This is a testcase to verify the project path to Xcode page
XcodePageHeader

    XcodePage
    set selenium implicit wait  ${timer}

     ${get_text}  Get WebElements  ${XcodePathHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a testcase to create new Xcode
CreateNewXcode

    XcodePage
    set selenium implicit wait  ${timer}

    click element   ${NewXcode_Btn_Xpath}

    input text  id:txtNewXcodeName  Xcode1
    input text  id:txtXcodeCustomerId  1
    input text  id:txtXcodeDescription  This is the first xcode under test

    click element   ${SelectModulefromList_Xpath}

    Choose File  id:xcodepopImg  C://Users//KnoDTec - Dheeraj//Downloads//Xcode_Module_img.png

    click element   ${NewXcodeSaveBtn_Xpath}

    page should contain  XCode Added successfully.
    close browser

# This is a testcase to Edit Xcode
EditXcode

    XcodePage
    set selenium implicit wait  ${timer}

    click element   ${SelectXcodecheckbox_Xpath}

    click element   ${XcodeEdit_Btn_Xpath}

    input text  id:txtNewXcodeName1  TestXCode1
    input text  id:txtXcodeCustomerId1  2
    input text  id:txtXcodeDescription1  This is edited Xcode under test


    Choose File  id:xcodepopImg  C://Users//KnoDTec - Dheeraj//Downloads//Xcode_Module_img.png

    click element   ${XcodeEdit_SaveBtn_Xpath}

    wait until page contains  XCode Updated successfully.
    close browser

# This is a testcase to Edit Xcode Pins
# This is a testcase to show the dynamic data fetching from module properties and set the value in xcode pin input field
XcodePinsEdit

    ModulePage
    set selenium implicit wait  ${timer}

    ${ModulePin_text}  Get WebElements    ${Module_Element_Xpath}

    sleep   1

    FOR  ${item}    IN  @{ModulePin_text}
        Log TO Console  ${item.text}
    END
    close browser

    XcodePage
    set selenium implicit wait  ${timer}

    sleep   1

    ${XcodeCtp}  Set Variable   ${ModulePin_text}

    Input Text  ${xcodeCtp_xpath}   ${ctpName_xpath}

    click element   ${XcodePinupdate_btn_xpath}
    close browser

# This is a testcase to create copy of Xcode
CopyXcode

    XcodePage
    set selenium implicit wait  ${timer}

    click element   ${XcodeCopy_Btn_Xpath}

    sleep   1

    click element   ${SelectXcodefromList_Xpath}

    input text  id:txtCopyXcodeName  XCode201
    input text  id:txtCopyXcodeCustomerId  2
    input text  id:txtCopyXcodeDescription  This is a duplicate copy of Xcode

    sleep   1

    click element   ${XcodeCopy_SaveBtn_Xpath}

    wait until page contains    Added Successfully.
    close browser

# This is a testcase to delete selected Xcode
DeleteXcode

    XcodePage
    set selenium implicit wait  ${timer}

    click element   ${XcodeDelete_Btn_Xpath}

    click element   ${XcodeConfirmDelete_Btn_Xpath}

    wait until page contains  Deleted Successfully.
    close browser