*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
AddExhibitor
    [Documentation]    Check that Event Organiser can add Exhibitors to the event
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-exhibitors
    Click Button    name=add-partner
    Input Text    css:form.t-a-p input[name=testcompany-name]    Exhibitor 115
    ${partner_name}=    Get Value    css:form.t-a-p input[name=testcompany-name]
    Input Text    css:form.t-a-p input[name=testbooth-location]    booth14
    Input Text    css:form.t-a-p input[name=testowner-name]    Monika
    Capture Page Screenshot
    Input Text    css:form.t-a-p input[name=testowner-surname]    Om
    Input Text    css:form.t-a-p input[name=testowner-email]    komal.nevatia+part4590@gmail.com
    Select From List By Value    css:form.t-a-p select[name=rating]    4
    Select Checkbox    css:form.t-a-p input[name=agenda-enabled]
    Click Button    name=testsave-button
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Exhibitor 115
    Capture Page Screenshot

MeetExhibitor
    [Documentation]    "Check that participant can
    ...    send Meeting invite to any Exhibitor by clicking on Meet option"
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-exhibitors
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Exhibitor 115
    Sleep    6s
    Wait Until Page contains Element    css:button.t-m-btn
    Click Button    css:button.t-m-btn
    Click button    css:div.modal-body button[name=testnull]
    Sleep    6s
    Capture Page Screenshot
    Click Element    css:li.t-inv-i
    Click Element    css:li.t-inv-s
    Capture Page Screenshot
    Click Element    css:div.t-b-det
    Capture Page Screenshot

PartcicipantCannotEditExhibitor
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-exhibitors
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Exhibitor 115
    Wait Until Page does not contain    Exhibitor 113
    Capture Page Screenshot
    Page should not contain Element    css:button.t-edit-btn
    Capture Page Screenshot

EventOrganiser_EditExhibitor
    [Documentation]    Check that Event Organiser can edit the Exhibitor details
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-exhibitors
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Exhibitor 115
    Wait Until Page does not contain    Partner13
    Capture Page Screenshot
    Click Element    css:div.t-b-det
    Click Button    css:button.t-edit-btn
    Input Text    css:form.t-e-p input[name=testname]    Ex15
    Input Text    css:form.t-e-p input[name=testbooth-location]    newLoc
    Select From List by Value    css:form.t-e-p select[name=booth-rating]    2
    Input Text    css:form.t-e-p input[name=testwebsite]    nokia.com
    Input Text    css:form.t-e-p input[name=testaddress]    czc
    input Text    css:textarea.t-about    asnas
    Scroll element into view    css:form.t-e-p input[name=testname]
    Capture Page Screenshot
    click button    name=testsave-button
    Click Element    css:li.t-exhibitors
    Input Text    css:search.t-ps input    Ex15
    Capture Page Screenshot

ExhibitorCanEditOwnProfile
    [Documentation]    Check that Exhibitor can edit his own profile details on exhibitor page
    [Setup]    LoginAsExhibitor
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-exhibitors
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Arctic
    Wait Until Page does not contain    Partner13
    Capture Page Screenshot
    Click Element    css:div.t-b-det
    Click Button    css:button.t-edit-btn
    Input Text    css:form.t-e-p input[name=testname]    ExhibitorArc
    Input Text    css:form.t-e-p input[name=testbooth-location]    newLoc
    Select From List by Value    css:form.t-e-p select[name=booth-rating]    2
    Input Text    css:form.t-e-p input[name=testwebsite]    nokia.com
    Input Text    css:form.t-e-p input[name=testaddress]    czc
    input Text    css:textarea.t-about    asnas
    Scroll element into view    css:form.t-e-p input[name=testname]
    Capture Page Screenshot
    click button    name=testsave-button
    Click Element    css:li.t-exhibitors
    Input Text    css:search.t-ps input    ExhibitorArc
    Capture Page Screenshot

ExhibitorAddTeamMember
    [Setup]    LoginAsExhibitor
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    Company
    Select From List by value    team
    Click element    new member
    Select From List by value    role    admin
    Select From List by value    participany
    Click element    add member
    Wait until page contains
    Capture Page Screenshot

DeleteExhibitor
    [Documentation]    "Check that Event Organiser can
    ...    delete exhibitor from the event"
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-exhibitors
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Ex15
    Capture Page Screenshot
    Click Button    css:button.t-dp
    Handle Alert
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Ex15
    Wait Until Page does not Contain    Ex15
    Capture Page Screenshot

MandatoryFieldCheck
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-exhibitors
    Click Button    name=add-partner
    Input Text    css:form.t-a-p input[name=testcompany-name]    Exhibitor 115
    ${partner_name}=    Get Value    css:form.t-a-p input[name=testcompany-name]
    Capture Page Screenshot
    Input Text    css:form.t-a-p input[name=testowner-surname]    Om
    Select From List By Value    css:form.t-a-p select[name=rating]    4
    Select Checkbox    css:form.t-a-p input[name=agenda-enabled]
    Element Should Be Disabled    name=testsave-button

TeamMemberAcceptsExhibitorRequest
    [Setup]    LoginAsTeamMember
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Handle Alert
    Click Element    css:li.t-exhibitors
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    ExhibitorArc
    Click element    exhibitor name
    Capture page screenshot

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

LoginAsExhibitor
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia+part999@gmail.com
    Input Password    name=testpassword    testing999
    Click Button    name=testloginSubmit-button
    Sleep    6s

LoginAsTeamMember
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia+part3698gmail.com
    Input Password    name=testpassword    testing3698
    Click Button    name=testloginSubmit-button
    Sleep    6s
