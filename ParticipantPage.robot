*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
EventInfoLink
    [Documentation]    Check that event information such as event name , event day date, location, description of the evnt is visible under Info section
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Click Element    css:li.t-inf-i i
    Capture Page Screenshot

Chat
    [Documentation]    Check that Participant can send chat messages to other particpants and that all messages can be seen under Chats section
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Input Text    css:search.t-s-p input    Andre
    Sleep    6s
    Click element    css:div.t-ch i
    Sleep    6s
    Capture Page Screenshot
    Input Text    css:textarea.t-ch-tf    hii Micheal here
    Click Element    css:i.chat-send-btn
    Sleep    6s
    Capture Page Screenshot
    LoginAsAndre
    Click Element    css:li.t-chat-i i
    Sleep    6s
    Input Text    css:search.t-s-n input    Michael
    Capture Page screenshot

YourAgenda
    [Documentation]    Check that user is able to set his Off time and can see all his sessions and OFF time under Your Agenda section
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Click Element    css:li.t-ag-i i
    Click button    css:button.t-off-btn
    Input Text    css:form.t-off-t timepicker[name=t-st-t] input    15
    Input Text    css:form.t-off-t timepicker[name=t-end-t] input    16
    Capture Page Screenshot
    Click element    css:form.t-off-t timepicker
    Click Button    css:div.modal-footer button.t-s-btn
    Sleep    6s
    Input Text    css:search.t-s-c input    Off
    Capture Page Screenshot

EditProfile
    [Documentation]    Check that user can edit his own profile details like Name, Surname, company, job, country, website, city, phone
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Click Element    css:li.t-prof-i img
    Capture Page Screenshot
    Click Element    css:div.t-ed-p i
    Capture Page Screenshot
    Input Text    css:form.t-prof-p input[name=testname]    mik
    Input Text    css:form.t-prof-p input[name=testsurname]    N
    Input Text    css:form.t-prof-p input[name=testcompany]    AGrid
    Input Text    css:form.t-prof-p input[name=testjobTitle]    Developer
    Capture Page Screenshot
    Input Text    css:form.t-prof-p input[name=testwebsite]    dealroomevevents.com
    Input Text    css:form.t-prof-p input[name=testcountry]    Finland
    Input Text    css:form.t-prof-p input[name=testcity]    Helsnki
    Input Text    css:form.t-prof-p input[name=testphone]    919930549906
    Click Button    name=testsave-btn
    Click Element    css:li.t-inf-i i
    Click Element    css:li.t-prof-i img
    Sleep    6s
    Capture Page Screenshot

Logout
    [Documentation]    Check that logged in user is able to logout from the application by clciking logout
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Capture Page Screenshot
    Click Element    css:li.t-prof-i img
    Click Element    css:div.t-logout
    Page Should contain    text=Log in to Deal Room
    Capture Page Screenshot

MeetParticipant
    [Documentation]    Check that user is able to send Meeting invite to other participant
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Input Text    css:search.t-s-p input    Andre
    Sleep    6s
    Click Element    css:div.t-m-act span
    Sleep    6s
    Input Text    css:textarea.t-m-ta    hi
    Click Button    css:button.t-send-btn
    Capture Page Screenshot
    LoginAsAndre
    Click Element    css:li.t-chat-i i
    Click Element    css:li.t-inv-s
    Wait until page contains element    css:search.t-s-n input
    Input Text    css:search.t-s-n input    Michael
    Capture Page screenshot

AddToFavorite
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Input Text    css:search.t-s-p input    Heera
    Wait Until Page Contains Element    css:loading-button-i.t-fav i
    Capture Page Screenshot
    Click Element    css:loading-button-i.t-fav i
    Capture Page Screenshot
    Click Element    css:button.t-f-btn
    Capture Page Screenshot

RemoveFromFavorite
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:button.t-f-btn
    Capture Page Screenshot
    Click Element    css:button.t-f-btn
    Input Text    css:search.t-s-p input    Heera
    Wait Until Page Contains Element    css:loading-button-i.t-fav i
    Capture Page Screenshot
    Click Element    css:loading-button-i.t-fav i
    Wait Until Page does not contain    text=Heera
    Capture Page Screenshot

AddToIgnored
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Input Text    css:search.t-s-p input    Heera
    Wait Until Page Contains element    css:loading-button-i.t-hid i
    Capture Page Screenshot
    Click Element    css:loading-button-i.t-hid i
    Capture Page Screenshot
    Click Element    css:button.t-i-btn
    Capture Page Screenshot

RemoveFromIgnored
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:loading-button-i.t-hid i
    Capture Page Screenshot
    Click Element    css:button.t-i-btn
    Input Text    css:search.t-s-p input    Heera
    Sleep    6s
    Capture Page Screenshot
    Click Element    css:loading-button-i.t-hid i
    Capture Page Screenshot
    Click Button    css:button.t-a-btn
    Input Text    css:search.t-s-p input    Heera

AcceptMeetingInvite
    [Setup]    LoginAsSender
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Input Text    css:search.t-s-p input    Andre
    Sleep    6s
    Click Element    css:div.t-m-act span
    Sleep    6s
    Input Text    css:textarea.t-m-ta    hi
    Click Button    css:button.t-send-btn
    Capture Page Screenshot
    LoginAsAndre
    Click Element    css:li.t-chat-i i
    Click Element    css:li.t-inv-r
    Wait until page contains element    css:search.t-s-n input
    Input Text    css:search.t-s-n input    Michael
    Capture Page screenshot
    Click Button    respond
    Capture Page Screenshot
    Click Button    Accept
    Click Element    select time
    Click Button    send
    LoginAsSender
    Click Element    css:li.t-chat-i i
    Click Element    css:li.t-inv-s
    Wait until page contains element    css:search.t-s-n input
    Input Text    css:search.t-s-n input    Michael

WithdrawMeetingInvite
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Input Text    css:search.t-s-p input    Andre
    Sleep    6s
    Click Element    css:div.t-m-act span
    Sleep    6s
    Input Text    css:textarea.t-m-ta    hi
    Click Button    css:button.t-send-btn
    Capture Page Screenshot
    LoginAsAndre
    Click Element    css:li.t-chat-i i
    Click Element    css:li.t-inv-r
    Wait until page contains element    css:search.t-s-n input
    Input Text    css:search.t-s-n input    Michael
    Capture Page screenshot
    LoginAsSender
    Click Element    css:li.t-chat-i i
    Click Element    css:li.t-inv-s
    Wait until page contains element    css:search.t-s-n input
    Input Text    css:search.t-s-n input    Michael
    click element    withdraw

DeclineMeetingInvite
    [Setup]    LoginAsSender
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Input Text    css:search.t-s-p input    Andre
    Sleep    6s
    Click Element    css:div.t-m-act span
    Sleep    6s
    Input Text    css:textarea.t-m-ta    hi
    Click Button    css:button.t-send-btn
    Capture Page Screenshot
    LoginAsAndre
    Click Element    css:li.t-chat-i i
    Click Element    css:li.t-inv-r
    Wait until page contains element    css:search.t-s-n input
    Input Text    css:search.t-s-n input    Michael
    Capture Page screenshot
    Click Button    respond
    Capture Page Screenshot
    Click Button    decline
    Input Text    message
    Click Button    send
    LoginAsSender
    Click Element    css:li.t-chat-i i
    Click Element    css:li.t-inv-s
    Wait until page contains element    css:search.t-s-n input
    Input Text    css:search.t-s-n input    Michael
    Wait Until Page contains     text=Declined
    Capture Page screenshot

RescheduleMeetingInvite

*** Keywords ***
LoginAsParticipant
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia+part5009@gmail.com
    Input Password    name=testpassword    testing5009
    Click Button    name=testloginSubmit-button
    Sleep    6s

LoginAsOrganiser
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia@gmail.com
    Input Password    name=testpassword    testing2015
    Click Button    name=testloginSubmit-button
    Sleep    6s

LoginAsAndre
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia+part3698@gmail.com
    Input Password    name=testpassword    testing3698
    Click Button    name=testloginSubmit-button
    Sleep    6s

LoginAsSender
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia+part5009@gmail.com
    Input Password    name=testpassword    testing5009
    Click Button    name=testloginSubmit-button
    Sleep    6s
