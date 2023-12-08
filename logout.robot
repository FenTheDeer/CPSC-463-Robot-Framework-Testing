*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:8069/web#cids=1&default_active_id=mail.box_inbox&action=104&menu_id=75&active_id=mail.box_inbox
${BROWSER}        Chrome

*** Test Cases ***
My logout test case
    I want to open odoo login page

    Input my username    nyah@idk.com
  
    Input my password    student

    Submit my credentials
    Sleep    5s   

    I should have logged in 
    Sleep    2s   

    I want to click the administrator button
    Sleep    2s   

    Logout
    Sleep    2s
    
    I should have successfully logged out
    Sleep    2s   

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

I should have logged in 
    Title Should Be    Odoo - Discuss

I want to click the administrator button
    Click Element       xpath=/html/body/header/nav/div[2]/div[4]/button

I should have successfully logged out
    Title Should be     Login | My Website

Logout
    Click Element       xpath=/html/body/header/nav/div[2]/div[4]/div/a[3]

