*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           ExcelLibrary.py

*** Test Cases ***
EventOrganiser_AddPartner
    [Documentation]    Check Event Organiser is able to add Partner to the Event.
    ...
    ...    Steps:
    ...    Login as Event organiser.
    ...    Click on the event
    ...    Go to Partner page
    ...    Click on Add Partner and fill all the fields and click Save
    ...    Partner profile should be created and should display details entered .
    [Tags]    tag16
    [Setup]    BrowserLogin
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Click Button    name=add-partner
    Input Text    css:form.t-a-p input[name=testcompany-name]    Partner 22
    ${partner_name}=    Get Value    css:form.t-a-p input[name=testcompany-name]
    Input Text    css:form.t-a-p input[name=testbooth-location]    booth14
    Input Text    css:form.t-a-p input[name=testowner-name]    Johny
    Input Text    css:form.t-a-p input[name=testowner-surname]    Om
    Input Text    css:form.t-a-p input[name=testowner-email]    komal.nevatia+part5085@gmail.com
    Select From List By Value    css:form.t-a-p select[name=rating]    4
    Select Checkbox    css:form.t-a-p input[name=agenda-enabled]
    Click Button    name=testsave-button
    Wait Until Page Contains Element    css:search.t-ps input
    Capture Page Screenshot    imag1.png
    Input Text    css:search.t-ps input    ${partner_name}
    Capture Page Screenshot
    Log    Partner created

SearchPartner
    [Documentation]    Check if the user is able to search Partner on Partner page.
    ...
    ...    Steps:
    ...    Login as Organiser / Participant and select an Event that has partners added to it
    ...    Go to Partner page and enter Partner name in Search option and check if search results are correct.
    [Tags]    tag15
    [Setup]    BrowserLogin
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Partner 22
    Wait Until Page does not contain    Partner13
    Capture Page Screenshot

Participant Cannot Delete Partner
    [Documentation]    Check That Participant does not have option to Delete Partner
    ...
    ...    Steps:
    ...    Login as Participant
    ...    Go to Event, Click on Partner.
    ...    Check Delete button not present against the Partner
    [Setup]    ParticipantLogin
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Partner 22
    Page Should not contain Button    css:div.company-card button[name=testnull]
    Capture Page Screenshot

Participant can send Meeting invite to Partner
    [Documentation]    Check that Participant can send Meeting invite to Partner
    [Setup]    ParticipantLogin
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Partner 22
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

Participant cannot edit Partner
    [Documentation]    Check that Participant cannot edit Partner details
    [Setup]    ParticipantLogin
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Partner 23
    Wait Until Page does not contain    Partner13
    Capture Page Screenshot
    Click Element    css:div.t-b-det
    Page should not contain Button    css:button.t-edit-btn

Organiser_Edit_Partner
    [Documentation]    Check that Event Organiser can Edit the Partner details
    [Setup]    BrowserLogin
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Partner 22
    Wait Until Page does not contain    Partner13
    Capture Page Screenshot
    Click Element    css:div.t-b-det
    Click Button    css:button.t-edit-btn
    Input Text    css:form.t-e-p input[name=testname]    PartnerNew22
    Input Text    css:form.t-e-p input[name=testbooth-location]    newLoc
    Select From List by Value    css:form.t-e-p select[name=booth-rating]    2
    Input Text    css:form.t-e-p input[name=testwebsite]    nokia.com
    Input Text    css:form.t-e-p input[name=testaddress]    czc
    input Text    css:textarea.t-about    asnas
    Scroll element into view    css:form.t-e-p input[name=testname]
    Capture Page Screenshot
    click button    name=testsave-button
    Click Element    name=partners
    Input Text    css:search.t-ps input    PartnerNew22
    Capture Page Screenshot

Organsier Can delete Partner
    [Documentation]    Check that Event organiser can delete the partner
    [Setup]    BrowserLogin
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    PartnerNew22
    Capture Page Screenshot
    Click Button    css:div.company-card button[name=testnull]
    Handle Alert
    Input Text    css:search.t-ps input    PartnerNew22
    Capture Page Screenshot

Participant can see Partner tab if Partner present
    [Documentation]    Check that if an event has any Partner added to it, the Partner tab should be visible to Participants.
    [Setup]    ParticipantLogin
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Capture Page Screenshot
    Page Should contain element    name=partners

Participant cannot see Partner if no partner present
    [Documentation]    Check that if an event doesnt have any Partner added to it, the Partner tab should not be visible to Participants.
    [Setup]    ParticipantLogin
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Capture Page Screenshot
    Page Should not contain element    name=partners

ClickCancelAddPartner
    [Setup]    BrowserLogin
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Click Button    name=add-partner
    Input Text    css:form.t-a-p input[name=testcompany-name]    Partner 50
    ${partner_name}=    Get Value    css:form.t-a-p input[name=testcompany-name]
    Input Text    css:form.t-a-p input[name=testbooth-location]    booth14
    Input Text    css:form.t-a-p input[name=testowner-name]    Olimoni
    Capture Page Screenshot
    Input Text    css:form.t-a-p input[name=testowner-surname]    Om
    Input Text    css:form.t-a-p input[name=testowner-email]    komal.nevatia+part5005@gmail.com
    Select From List By Value    css:form.t-a-p select[name=rating]    4
    Select Checkbox    css:form.t-a-p input[name=agenda-enabled]
    Click Button    name=cancel-button
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    ${partner_name}
    Capture Page Screenshot
    Log    Partner not created

*** Keywords ***
BrowserLogin
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia@gmail.com
    Input Password    name=testpassword    testing2015
    Click Button    name=testloginSubmit-button
    Sleep    6s

ParticipantLogin
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia+part5009@gmail.com
    Input Password    name=testpassword    testing5009
    Click Button    name=testloginSubmit-button
    Sleep    6s
