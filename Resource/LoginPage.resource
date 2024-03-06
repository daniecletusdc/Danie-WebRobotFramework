
*** Settings ***
Library    SeleniumLibrary
Library    String
Library    ../CustomLibrary/Home.py
*** Variables ***
${btnLogin}    id:login2
${txtUserName}        id:loginusername
${txtPassword}        id:loginpassword
${btnSubmit}        css:button[onclick='logIn()']
${lblError}        xpath://*[@data-test='error']
${lblUserName}    id:nameofuser

*** Keywords ***

the user verify application launched
    Title Should Be    STORE
    Capture Page Screenshot
the user close the browser session
    Close Browser
the user login with wrong login credentials
    [Arguments]    ${strUserID}    ${strPassword}
    Click Element    ${btnLogin}
    Sleep    2
    Input Text    ${txtUserName}        ${strUserID}
    Input Password    ${txtPassword}    ${strPassword}
    Click Button    ${btnSubmit}
    Alert Should Be Present    Wrong password.
the user login with valid login credentials
    [Arguments]    ${strUserID}    ${strPassword}
    Click Element    ${btnLogin}
    Sleep    2
    Input Text    ${txtUserName}        ${strUserID}
    Input Password    ${txtPassword}    ${strPassword}
    Click Button    ${btnSubmit}
    Sleep    2
    Alert Should Not Be Present
    Page Should Contain Element    ${lblUserName}
