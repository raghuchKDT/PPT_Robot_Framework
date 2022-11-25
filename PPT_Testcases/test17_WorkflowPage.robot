*** Settings ***
Resource    ../Resource_setupnteardown.robot
Resource    ../Resource/Resource_Workflow.robot
Test Setup       Open Browser And Maximize
Test Teardown    Close Browser Window


*** Keywords ***

# This is a Keyword defined to navigates to Workflow Page
WorkflowPage

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


# This is a testcase to create new Workflow
CreateNewWorkflow

    WorkflowPage
    set selenium implicit wait  ${timer}

    click element   ${NewWorkflow_Btn_Xpath}

    input text  id:workflowName  TestWorkflow1
    input text  id:workflowDesc  This is a workflow under test

    click element   ${NewWorkflowSaveBtn_Xpath}

    page should contain  Data Added Successfully.


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


# This is a testcase to create copy of a Workflow
CopyWorkflow

    WorkflowPage
    set selenium implicit wait  ${timer}

    click element  ${SelectWorkflowcheckbox_Xpath}

    click element   ${WorkflowCopy_Btn_Xpath}

    input text  id:txtNewWorkflowName  Workflow2

    click element   ${WorkflowCopy_SaveBtn_Xpath}

    page should contain  Data Added Successfully.


# This is a testcase to Delete a Workflow
DeleteWorkflow

    WorkflowPage
    set selenium implicit wait  ${timer}

    click element   ${SelectWorkflowcheckbox_Xpath}

    click element   ${WorkflowDelete_Btn_Xpath}

    click element   ${WorkflowConfirmDelete_Btn_Xpath}

    page should contain  Deleted Successfully.

