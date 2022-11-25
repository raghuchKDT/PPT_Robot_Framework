*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${VariantExplorerTab_Xpath}   xpath:/html/body/div[1]/div[2]/main/div[2]/div/ul/li[5]/a
${WireTab_Xpath}   xpath://*[@id="pills-wire-tab"]
${WirePathHeader_Xpath}  xpath://*[@id="selespanProj"]
${NewWireBtn_Xpath}    xpath://*[@id="deChk2"]/div[1]/div[1]/div[1]/button[1]
${SelectWireColor1_Xpath}   xpath://*[@id="drdcolor1"]/option[3]
${SelectWireColor2_Xpath}   xpath://*[@id="drdcolor2"]/option[4]
${SelectWireColor3_Xpath}   xpath://*[@id="drdcolor3"]/option[1]
${SelectWirePTLName_Xpath}  xpath://*[@id="drdPickToLightId"]/option[2]
${SelectWireWLEDname_Xpath}  xpath://*[@id="txtNewWledPinName"]/option[6]
${NewWireSaveBtn_Xpath}    xpath://*[@id="btn-add-wire"]
${SelectWirecheckbox_Xpath}    xpath:/html/body/div[1]/div[2]/main/div[3]/div/div[2]/div[2]/div[3]/div[2]/div/div/div[1]/div[2]/div[2]/div/div[1]/div/input
${WireEdit_Btn_Xpath}  xpath://*[@id="btn-wire-edit"]
${EditWireColor1_Xpath}  xpath://*[@id="drdcolor1"]/option[1]
${EditWireColor2_Xpath}  xpath://*[@id="drdcolor2"]/option[2]
${EditWireColor3_Xpath}  xpath://*[@id="drdcolor3"]/option[4]
${EditWirePTLName_Xpath}    xpath://*[@id="drdPickToLightId"]/option[2]
${EditWireWLEDname_Xpath}   xpath://*[@id="txtNewWledPinName"]/option[5]
${EditWireUpdateBtn_Xpath}  xpath://*[@id="btn-update-wire"]
${WireCopy_Btn_Xpath}   xpath://*[@id="btn-wire-copy"]
${CopyWireSaveAsBtn_Xpath}  xpath://*[@id="btn-copy-wire"]
${WireDelete_Btn_Xpath}  xpath://*[@id="btn-wire-delete"]
${WireConfirmDelete_Btn_Xpath}  xpath://*[@id="btn-delete-wire"]
