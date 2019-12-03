*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
AddSpeaker
    [Documentation]    Check that Event Organiser can Add Speaker profile to the event.
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Click Element    css:li.t-speakers a
    Wait Until Page Contains Element    css:search.t-s-s input
    Click Button    css:button.t-a-s
    Input Text    css:form.t-a-s input[name=testname]    Jose
    Input Text    css:form.t-a-s input[name=testsurname]    K
    Input Text    css:form.t-a-s input[name=testemail]    komal.nevatia+part6965@gmail.com
    Input Text    css:form.t-a-s input[name=testcompany]    dealroom
    Input Text    css:form.t-a-s input[name=testjobTitle]    CTO
    Capture Page Screenshot
    Input Text    css:form.t-a-s input[name=testwebsite]    dealroomevents.com
    Input Text    css:form.t-a-s input[name=testcountry]    Finland
    Input Text    css:form.t-a-s input[name=testcity]    espoo
    Input Text    css:form.t-a-s input[name=testphone]    045222888
    Select Checkbox    name=speaker
    Select Checkbox    name=participant
    Input Text    css:textarea.t-bio    bio
    Click Button    css:button.t-save-btn
    Sleep    6s
    Input Text    css:search.t-s-s input    Jose
    Capture Page screenshot

SearchSpeaker
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Click Element    css:li.t-speakers a
    Wait Until Page Contains Element    css:search.t-s-s input
    Input Text    css:search.t-s-s input    Jose
    Capture Page screenshot

PartcipantViewSearchSpeaker
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Click Element    css:li.t-speakers a
    Wait Until Page Contains Element    css:search.t-s-s input
    CapturePageScreenshot
    Input Text    css:search.t-s-s input    Jose
    Capture Page screenshot

ParticipantCannotEditSpeakerProfile
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Click Element    css:li.t-speakers a
    Input Text    css:search.t-s-s input    Jose
    Page Should not Contain element    css:a.t-s-d

EditSpeaker
    [Documentation]    Check that Event Organiser can edit Speaker profile in the event.
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Click Element    css:li.t-speakers a
    Input Text    css:search.t-s-s input    Jose
    Click Element    css:a.t-s-d
    Click Element    css:a.t-s-e
    Wait Until Page Contains Element    css:form.t-a-s input[name=testname]
    Input Text    css:form.t-a-s input[name=testname]    Jasmine
    Input Text    css:form.t-a-s input[name=testsurname]    J
    Scroll Element into view    css:form.t-a-s input[name=testcountry]
    Input Text    css:form.t-a-s input[name=testcompany]    Dealroom
    Input Text    css:form.t-a-s input[name=testjobTitle]    Arch
    Capture Page Screenshot
    Input Text    css:form.t-a-s input[name=testwebsite]    dealroomevents.com
    Input Text    css:form.t-a-s input[name=testcountry]    Finland
    Input Text    css:form.t-a-s input[name=testcity]    Espoo city
    Input Text    css:form.t-a-s input[name=testphone]    045212777
    Click Button    css:button.t-save-btn
    Input Text    css:search.t-s-s input    Jasmine
    Capture Page screenshot

SpeakerNotVisisbleOnParticipant
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Input Text    css:search.t-s-p input    Jasmine
    Capture Page Screenshot
    Click Element    css:li.t-speakers a
    Input Text    css:search.t-s-s input    Jasmine
    Capture Page Screenshot
    Click Element    css:a.t-s-d
    Click Element    css:a.t-s-e
    UnSelect Checkbox    css:form.t-a-s input[name=participant]
    Click button    css:button.t-save-btn
    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Input Text    css:search.t-s-p input    Jasmine
    Page Should not Contain    text=Jasmine

DeleteSpeaker
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.t-s-p input
    Click Element    css:li.t-speakers a
    Input Text    css:search.t-s-s input    Jasmine
    Capture Page Screenshot
    Click Element    css:a.t-s-d
    Click Element    css:a.t-s-e
    Scroll element into view    css:textarea.t-bio
    UnSelect Checkbox    css:form.t-a-s input[name=speaker]
    Click button    css:button.t-save-btn
    Input text    css:search.t-s-s input    Jasmine
    Page should not contain    text=Jose
    Sleep    6s
    Capture Page Screenshot

*** Keywords ***
LoginAsOrganiser
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia@gmail.com
    Input Password    name=testpassword    testing2015
    Click Button    name=testloginSubmit-button
    Sleep    6s

LoginAsParticipant
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia+part5009@gmail.com
    Input Password    name=testpassword    testing5009
    Click Button    name=testloginSubmit-button
    Sleep    6s
