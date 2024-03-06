*** Settings ***
Documentation    This is a sample automation test case in robot framework
Library    SeleniumLibrary
Resource    ../Resource/LoginPage.resource
Resource    ../Resource/Generic.resource
Test Setup    Read CSV file
*** Variables ***

*** Test Cases ***

Open demo application and verify login page displayed
    [Tags]    LOGINN
    Given the User Open Website
    And The User Verify Application Launched
    And The User Close The Browser Session
validate error message displayed when the user enter wrong credentials
    [Tags]    SMOKE
    Given the User Open Website
    And The User Verify Application Launched
    Then The User Login With Wrong Login Credentials    ${Username}    ${Password}
    And The User Close The Browser Session
validate the user loggedIn with valid credentials
    [Tags]    SANITY
    Given the User Open Website
    And The User Verify Application Launched
    Then the user login with valid login credentials    ${Username}   ${Password}
    And The User Close The Browser Session
