*** Settings ***
Library  RequestsLibrary


*** Variables ***
${base-url}  http://127.0.0.1:5004/api/

*** Test Cases ***

fetchdata
      create session   myssion    ${base-url}

      ${response} =  get on session    myssion    ProjectAPI/GetProjects

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}

fetchdata1
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectAPI/GetVariants

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}


fetchdata2
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectAPI/GetWorkflows

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}


fetchdata3
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectAPI/GetGlobalVariables

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}

fetchdata4
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectAPI/GetSystemGroups

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}

fetchdata5
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectAPI/GetModules

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}


fetchdata6
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectSettingsAPI/GetSystemLogsNReports

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}


fetchdata7
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectSettingsAPI/GetPPTMasterCardData

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}


fetchdata8
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectSettingsAPI/GetDevices

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}


fetchdata9
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectSettingsAPI/GetInternalVarTypes

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}


fetchdata10
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectSettingsAPI/GetPinDefinitions

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}

fetchdata11
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    UserAPI/GetAccessSection

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}

fetchdata12
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    UserAPI/GetUser

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}

fetchdata13
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectAPI/GetXCodes

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}


fetchdata14
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectAPI/GetSplice

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}
      Log To Console    ${response.content}