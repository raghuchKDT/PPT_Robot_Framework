*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${ProjectMenu_Xpath}    xpath://*[@id="three"]
${WorkflowTab_Xpath}   xpath://*[@id="pills-workflow-tab"]
${ProjectWorkflowPathHeader_Xpath}  xpath://*[@id="selespanProj"]
${NewWorkflow_Btn_Xpath}    xpath://*[@id="bntGoToCreateWorkflow"]
${NewWorkflowSaveBtn_Xpath}    xpath://*[@id="btn-WorkSave"]
${SelectWorkflowcheckbox_Xpath}    xpath:
${WorkflowEdit_Btn_Xpath}   xpath://*[@id="btn-WorkEdit"]
${WorkflowEdit_SaveBtn_Xpath}   xpath://*[@id="btn-WorkSave"]
${WorkflowCopy_Btn_Xpath}  xpath://*[@id="btn-WorkSaveAs"]
${WorkflowCopy_SaveBtn_Xpath}  xpath://*[@id="btn-saveas-workflow"]
${WorkflowDelete_Btn_Xpath}    xpath://*[@id="btn-Workdelete"]
${WorkflowConfirmDelete_Btn_Xpath}  xpath://*[@id="btn-delete-workflow"]
