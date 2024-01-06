*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
*** Variables ***
${btnAddToCart}    css:.btn-success
${lblProductname}    css:.name
@{lstAddedProduct}
*** Keywords ***

the user verifies that product page is displayed
     [Arguments]    ${strSearchProduct}
     ${productName}=    Get Text    ${lblProductname}
     IF    "${productName}" == "${strSearchProduct}"
         Log     user navigated to product page
     ELSE
         Log    not navigated to correct page
     END

the user clicks the add to cart button
    Click Element    ${btnAddToCart}
    Sleep    2
    ${alertMessage}=    Handle Alert    
    Log    ${alertMessage}
    ${productName}=    Get Text    ${lblProductname}
    Append To List    ${lstAddedProduct}     ${productName}
    Log    ${lstAddedProduct}