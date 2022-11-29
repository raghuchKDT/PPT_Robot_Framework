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

fetchdata1
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectAPI/GetVariants

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}

fetchdata2
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectAPI/GetWorkflows

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}



fetchdata3
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectAPI/GetGlobalVariables

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}


fetchdata4
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectAPI/GetSystemGroups

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}


fetchdata5
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectAPI/GetModules

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}

fetchdata6
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectSettingsAPI/GetSystemLogsNReports

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}

fetchdata7
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectSettingsAPI/GetPPTMasterCardData

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}


fetchdata8
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectSettingsAPI/GetDevices

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}


fetchdata9
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectSettingsAPI/GetInternalVarTypes

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}


fetchdata10
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectSettingsAPI/GetPinDefinitions

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}

fetchdata11
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    UserAPI/GetAccessSection

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}

fetchdata12
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    UserAPI/GetUser

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}

fetchdata13
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectAPI/GetXCodes

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}


fetchdata14
      create session   myssion1    ${base-url}
      ${response} =  get on session    myssion1    ProjectAPI/GetSplice

      ${status}=   convert to string    ${response.status_code}

      should be equal      ${status}    200
      log to console      ${response.status_code}