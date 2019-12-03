*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
SentInvitations
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-inv-i
    Click Element    css:li.t-inv-s
    Capture Page Screenshot

SearchSentInvitations
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-inv-i
    Click Element    css:li.t-inv-s
    Capture Page Screenshot
    Input Text    css:search.t-s-i input    Meens
    Capture Page Screenshot

RecievedInvitation
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-inv-i
    Click Element    css:li.t-inv-r
    Capture Page Screenshot

SearchRecievedInvitation
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-inv-i
    Click Element    css:li.t-inv-r
    Capture Page Screenshot
    Input Text    css:search.t-s-i input    Komal
    Capture Page Screenshot

*** Keywords ***
LoginAsParticipant
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia+part5009@gmail.com
    Input Password    name=testpassword    testing5009
    Click Button    name=testloginSubmit-button
    Sleep    6s
