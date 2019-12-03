*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Test Cases ***
AddSponsor
    [Documentation]    Check Event Organiser is able to add Sponsor to the Event.
    ...
    ...    Steps:
    ...    Login as Event organiser.
    ...    Click on the event
    ...    Go to Sponsor page
    ...    Click on Add Sponsor and fill all the fields and click Save
    ...    Sponsor profile should be created and should display details entered .
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-sponsors a
    Capture Page Screenshot
    Click Button    name=add-partner
    Input Text    css:form.t-a-p input[name=testcompany-name]    Sponsor2019
    ${sponsor_name}=    Get Value    css:form.t-a-p input[name=testcompany-name]
    Input Text    css:form.t-a-p input[name=testbooth-location]    booth14
    Input Text    css:form.t-a-p input[name=testowner-name]    maximus
    Input Text    css:form.t-a-p input[name=testowner-surname]    Om
    Input Text    css:form.t-a-p input[name=testowner-email]    komal.nevatia+part5432@gmail.com
    Select From List By Value    css:form.t-a-p select[name=rating]    2
    Select Checkbox    css:form.t-a-p input[name=agenda-enabled]
    Click Button    name=testsave-button
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    ${sponsor_name}
    Wait Until Page does not contain    Partner13
    Capture Page Screenshot

UserCanSearchSponsor
    [Documentation]    Check if the user is able to search Sponsor on Sponsor page.
    ...
    ...    Steps:
    ...    Login as Organiser / Participant and select an Event that has partners added to it
    ...    Go to Sponsor page and enter Sponsor name in Search option and check if search results are correct.
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:li.t-sponsors a
    Click Element    css:li.t-sponsors a
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Sponsor2019
    Wait Until Page Contains    Sponsor2019
    Capture Page Screenshot

EventOrganiser_EditSponsor
    [Documentation]    Check that Event organiser can edit Sponsor details
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-sponsors a
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Sponsor2019
    Wait Until Page does not contain    Partner13
    Capture Page Screenshot
    Click Element    css:div.t-b-det
    Click Button    css:button.t-edit-btn
    Input Text    css:form.t-e-p input[name=testname]    Spon2019
    Input Text    css:form.t-e-p input[name=testbooth-location]    newLoc
    Select From List by Value    css:form.t-e-p select[name=booth-rating]    2
    Input Text    css:form.t-e-p input[name=testwebsite]    nokia.com
    Input Text    css:form.t-e-p input[name=testaddress]    czc
    input Text    css:textarea.t-about    asnas
    Scroll element into view    css:form.t-e-p input[name=testname]
    Capture Page Screenshot
    click button    name=testsave-button
    Click Element    css:li.t-sponsors a
    Input Text    css:search.t-ps input    Spon2019
    Capture Page Screenshot

Participant_Cannot_Delete_Sponsors
    [Documentation]    Login as participant and check that Particpant does not have option to Delete the Sponsor
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-sponsors a
    Input Text    css:search.t-ps input    Spon15
    Capture Page Screenshot
    Page Should not contain Button    css:div.company-card button[name=testnull]
    Capture Page Screenshot

Participant_can_see Sponsor tab if Sponsor present
    [Documentation]    Check that if \ Sponsors have been added to the event, then Participant should \ be able to see Sponsor tab
    [Setup]    LoginAsParticipant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Page Should contain Element    css:li.t-sponsors a
    Click Element    css:li.t-sponsors a
    Capture Page Screenshot

EventOrgansierCanDeleteSponsor
    [Documentation]    Check that Event Organiser is able to Delete the Sponsor
    ...
    ...    Steps
    ...    Login as Event Organiser.
    ...    Go the Event, Click on the Sponsor tab
    ...    Serach for the particular sponsor and click on Delete button
    [Setup]    LoginAsOrganiser
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-sponsors a
    Input Text    css:search.t-ps input    Sponsor2019
    Capture Page Screenshot
    Click Button    css:div.company-card button[name=testnull]
    Handle Alert
    Input Text    css:search.t-ps input    Sponsor2019
    Capture Page Screenshot

Participant cannot see Sponsor tab if Sponsor not added
    [Documentation]    Check that if no Sponsors have been added to the event, then Participant should not be able to see Sponsor tab
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Page Should not contain Element    css:li.t-sponsors a
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
