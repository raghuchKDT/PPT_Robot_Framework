*** Settings ***
Library  SeleniumLibrary

*** Variables ***

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
