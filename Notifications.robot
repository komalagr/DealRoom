*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
ViewSearchNotifications
    [Setup]    LoginAsParticipant
    Click Element    css:li.t-not-i
    Capture Page Screenshot
    Input Text    css:search.t-s-n input    Nela

*** Keywords ***
LoginAsParticipant
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia+part5009@gmail.com
    Input Password    name=testpassword    testing5009
    Click Button    name=testloginSubmit-button
    Sleep    6s
