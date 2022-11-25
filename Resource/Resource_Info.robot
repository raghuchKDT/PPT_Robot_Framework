*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${browser}  chrome
${url}  http://localhost:5003/
${timer}    4 seconds
${signinbutton_Xpath}   xpath://*[@id="layoutAuthentication_content"]/main/div/div[1]/div/div/form/div[4]/button
${RecentProjectHeader_Xpath}    xpath://*[@id="pills-home-tab"]
${RecentProjectsData_Xpath}    xpath://*[@id="tblProject_wrapper"]/div[2]/div
${VersionHistoryTab_Xpath}  xpath://*[@id="pills-profile-tab"]
${VersionHistoryData_Xpath}   xpath://*[@id="pills-profile"]/div/div
${OptionsTab_Xpath}  xpath://*[@id="pills-contact-tab"]
${OptionsTabData_Xpath}  xpath://*[@id="pills-contact"]

