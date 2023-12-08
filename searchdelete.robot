*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:8069/web#cids=1&action=399&model=hospital.patient&view_type=list&menu_id=287
${BROWSER}        Chrome
${patients}       http://localhost:8069/web#cids=1&menu_id=287&action=399&model=hospital.patient&view_type=list
${NAME}           James
${AGE}            24


*** Test Cases ***
My adding patient test case
    I want to open odoo login page

    Input my username    nyah@idk.com
  
    Input my password    student

    Submit my credentials
    Sleep    2s   

    I should see this page  
    Sleep    2s   

    I want to click the create button
    Sleep    2s   
    
    I should see this page part two
    Sleep    2s   

    Enter patient info    ${NAME}    ${AGE}
    Sleep    2s

    Submit patient info
    Sleep    2s   

    Go back to see all patients
    Sleep    2s

    Search User    ${NAME}
    Sleep    2s

    Click Item
    Sleep    2s

    Delete Stuff
    Sleep    2s

    Reload Page
    Sleep    5s
    [Teardown]    Close Browser

*** Keywords ***
I want to open odoo login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Login | My Website

Input my username
    [Arguments]    ${username}
    Input Text    login    ${username}

Input my password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit my credentials
    Click Element       //*[contains(text(),'Log in')]

I should see this page
    Title Should Be    Odoo - Patients

I want to click the create button
    Click Element       //*[contains(text(),'Create')]

I should see this page part two
    Title Should be     Odoo - New

Enter patient info
    [Arguments]    ${NAME}    ${AGE}
    Input Text    name    ${NAME}
    Input Text    age    ${AGE}

Submit patient info
    Click Element       //*[contains(text(),'Save')]

Go back to see all patients
    Go to    ${patients}

Search User
    [Arguments]     ${username}
    Input Text    class:o_searchview_input   ${username}
    Press Keys    None    RETURN

Click Item
    Click Element        class:o_data_row

Delete Stuff
    Click Element       //*[contains(text(),'Action')]
    Sleep     2s
    Mouse Over          //*[contains(text(),'Delete')]
    Sleep     2s
    Click Element       //*[contains(text(),'Delete')]
    Sleep     2s
    Click Element       //*[contains(text(),'Ok')]
    Sleep     2s