*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:8069/web#cids=1&action=399&model=hospital.patient&view_type=list&menu_id=287
${BROWSER}        Chrome
${PACIENTS}       http://localhost:8069/web#cids=1&menu_id=287&action=399&model=hospital.patient&view_type=list

*** Test Cases ***
My adding pacient test case
    I want to open odoo login page

    Input my username    nyah@idk.com
  
    Input my password    student

    Submit my credentials
    Sleep    5s   

    I should see this page  
    Sleep    2s   

    I want to click the create button
    Sleep    2s   
    
    I should see this page part two
    Sleep    2s   

    Enter pacient info    fro    12
    Sleep    1s

    Submit pacient info

    Sleep    2s   

    Go back to see all pacients
    Sleep    2s


    I should see this page
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

Enter pacient info
    [Arguments]    ${pacient}    ${age}
    Input Text    name    ${pacient}
    Input Text    age    ${age}

Submit pacient info
    Click Element       //*[contains(text(),'Save')]

Go back to see all pacients
    Go to    ${PACIENTS}

