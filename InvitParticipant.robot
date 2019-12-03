*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
OrganiserInviteParticipant
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Button    css:button.t-i-p-btn
    Input Text    css:form.t-inv-p input[name=testname]    Vij
    Input Text    css:form.t-inv-p input[name=testsurname]    B
    Input Text    css:form.t-inv-p input[name=testemail]    komal.nevatia+part3678@gmail.com
    Click Button    css:button.t-inv-btn
    Wait until page contains    text=Successfully invited
    Capture Page Screenshot

*** Keywords ***
LoginAsOrganiser
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia@gmail.com
    Input Password    name=testpassword    testing2015
    Click Button    name=testloginSubmit-button
    Sleep    6s
