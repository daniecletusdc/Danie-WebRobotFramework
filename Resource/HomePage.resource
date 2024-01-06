*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
*** Variables ***
${lblItemNames}    css:.title
${lnkHome}    xpath:(//a[@class='nav-link'])[1]
${lblcategory}    css:#cat

*** Keywords ***
the user verify the product is displayed
    [Arguments]    ${strSearchProduct}
    Sleep    2
    @{lstProdList}=    Get Webelements    class:hrefch
    ${len}=    Get Length   ${lstProdList}
    Log    ${len}
    FOR    ${strName}    IN     @{lstProdList}
        IF    "${strName.text}" == "${strSearchProduct}"
            Click Element    ${strName}
            Sleep    3
            Exit For Loop
        END
    END
the user clicks Home button
    Click Element    ${lnkHome}
    Wait Until Element Is Visible       ${lblcategory}
    Page Should Contain Element    ${lblcategory}
    Log    user navigated to home screen
