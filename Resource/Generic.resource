*** Settings ***
Library    OperatingSystem
Library    String
Library    Collections
Library    SeleniumLibrary
*** Variables ***
${URL}    https://www.demoblaze.com/index.html
${browser}    Firefox
${testDataFile}    TestData/Test1data.csv
*** Keywords ***
the user open website
    Open Browser    ${URL}   ${browser}
    Sleep    2
    Maximize Browser Window

Read CSV file
    ${env} =     Get Environment Variable    test_environment
    Log To Console    ${env}
    ${csvFile}    Get File    ${testDataFile}
    @{read}    Create List   ${csvFile}
    @{lines}    Split To Lines     @{read}

    FOR    ${line}    IN     @{lines}
        @{split}    Split String    ${line}     ,
        ${len}=    Get Length    ${split}
        ${tcName}=     Get From List    ${split}    0
        Log     ${TEST NAME}
        IF    "${tcName}" == "${TEST NAME}"
            FOR    ${index}    IN RANGE    1    ${len}
                ${para}=    Get From List    ${split}    ${index}
                @{parameter}    Split String  ${para}    :
                ${key}=    Get From List    ${parameter}    0
                ${value}=    Get From List    ${parameter}    1
                Set Global Variable    ${key}     ${value}

            END
            Exit For Loop
        ELSE
            Log    Test data not found
        END
    END
