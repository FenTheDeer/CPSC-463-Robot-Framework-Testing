*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:8069/web/login/
${BROWSER}        Chrome

*** Test Cases ***
My login test case
    I want to open odoo login page
    Sleep    5s
    Input my username    nyah@idk.com
    Sleep    5s   
    Input my password    student
    Sleep    5s
    Submit my credentials
    Sleep    5s   
    I should see this page  
    Sleep    5s   
    [Teardown]    Close Browser

Failed Login
    I want to open odoo login page
    Sleep    5s
    Input my username    hacker@idk.com
    Sleep    5s   
    Input my password    fail
    Sleep    5s
    Submit my credentials
    Sleep    5s   
    Did it fail

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
    Title Should Be    Odoo - Discuss

Did it fail
    Element Should Be Visible   xpath:/html/body/div[1]/main/div/form/p
