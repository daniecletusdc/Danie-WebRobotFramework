*** Settings ***
Documentation    This is a sample automation test cases for product page
Library    SeleniumLibrary
Resource    ../Resource/LoginPage.resource
Resource    ../Resource/HomePage.resource
Resource    ../Resource/ProductPage.resource
Resource    ../Resource/Generic.resource
Test Setup    Read CSV File
*** Variables ***

*** Test Cases ***
the user verifies that user is able to add the product to cart
    Given the User Open Website
    And The User Verify Application Launched
    Then the user login with valid login credentials    ${Username}   ${Password}
    And the user verify the product is displayed    ${ProductName1}
    And the user verifies that product page is displayed    ${ProductName1}
    Then The User Clicks The Add To Cart Button
    Then the user clicks Home button
    And the user verify the product is displayed    ${ProductName2}
    And the user verifies that product page is displayed    ${ProductName2}
    Then The User Clicks The Add To Cart Button

