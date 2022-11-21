*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
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

*** Keywords ***

# This is a Keyword defined to navigates to Workflow Page
WorkflowPage

    open browser    ${url}  ${browser}
    maximize browser window
    set selenium implicit wait  ${timer}

    input text  id:UserName  OCUA4
    input text  id:Password  1234

    click element   ${signinbutton_Xpath}

    click element   ${ProjectMenu_Xpath}

    click element   ${WorkflowTab_Xpath}

*** Test Cases ***

# This is a testcase to verify the project path to workflow page
WorkflowPath

    WorkflowPage
    set selenium implicit wait  ${timer}

    ${get_text}  Get WebElements  ${ProjectWorkflowPathHeader_Xpath}
    FOR  ${item}  IN  @{get_text}
      Log To Console  ${item.text}
    END

    close browser

# This is a testcase to create new Workflow
CreateNewWorkflow

    WorkflowPage
    set selenium implicit wait  ${timer}

    click element   ${NewWorkflow_Btn_Xpath}

    input text  id:workflowName  TestWorkflow1
    input text  id:workflowDesc  This is a workflow under test

    click element   ${NewWorkflowSaveBtn_Xpath}

    page should contain  Data Added Successfully.
    close browser

# This is a testcase to Edit Workflow
EditWorkflow

    WorkflowPage
    set selenium implicit wait  ${timer}

    click element   ${SelectWorkflowcheckbox_Xpath}

    click element   ${WorkflowEdit_Btn_Xpath}

    input text  id:workflowName  Workflow1
    input text  id:workflowDesc  This is edited workflow under test

    click element   ${WorkflowEdit_SaveBtn_Xpath}

    page should contain  Data Added Successfully.
    close browser

# This is a testcase to create copy of a Workflow
CopyWorkflow

    WorkflowPage
    set selenium implicit wait  ${timer}

    click element  ${SelectWorkflowcheckbox_Xpath}

    click element   ${WorkflowCopy_Btn_Xpath}

    input text  id:txtNewWorkflowName  Workflow2

    click element   ${WorkflowCopy_SaveBtn_Xpath}

    page should contain  Data Added Successfully.
    close browser

# This is a testcase to Delete a Workflow
DeleteWorkflow

    WorkflowPage
    set selenium implicit wait  ${timer}

    click element   ${SelectWorkflowcheckbox_Xpath}

    click element   ${WorkflowDelete_Btn_Xpath}

    click element   ${WorkflowConfirmDelete_Btn_Xpath}

    page should contain  Deleted Successfully.
    close browser
