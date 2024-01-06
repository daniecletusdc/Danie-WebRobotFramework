*** Settings ***
Documentation    This is a sample automation test cases for home page
Library    SeleniumLibrary
Resource    ../Resource/LoginPage.resource
Resource    ../Resource/HomePage.resource
Resource    ../Resource/ProductPage.resource
Resource    ../Resource/Generic.resource
Test Setup    Read CSV file
*** Variables ***

*** Test Cases ***
the user verify the product displayed in home screen
    [Tags]    HOME
    Given the User Open Website
    And The User Verify Application Launched
    Then the user login with valid login credentials    ${Username}   ${Password}
    And the user verify the product is displayed    ${ProductName}

the user verifies that product page is displayed
    [Tags]    HOME
    Given the User Open Website
    And The User Verify Application Launched
    Then the user login with valid login credentials    ${Username}   ${Password}
    And the user verify the product is displayed    ${ProductName}
    And the user verifies that product page is displayed    ${ProductName}

