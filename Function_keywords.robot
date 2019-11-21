*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           ExcelLibrary.py

*** Test Cases ***
tc2arg
    openwitharg    https://www.google.com
    Input Text    name:q    komal nevatia

TC03
    ${a}    Set Variable    Hi
    Log    ${a}
    ${number}    Set Variable    3
    ${b}    Set Variable if    ${number}<9    Yes    No
    Log    ${b}

Tc04
    test browser    https://www.google.com
    Capture Page Screenshot    page.png

Tc05
    [Template]    Display Message
    heloo
    welcome

tc6_fb
    Open Browser    https://www.facebook.com    chrome
    Title Should Be    Facebook - Log In or Sign Up
    Input Text    name=email    komal.nevatia@gmail.com
    Input Password    name=pass    vcvvvv

Create Account
    Open Browser    http://192.168.1.104:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testfname    Mitra
    ${firstname}=    Get Value    name=testfname
    Log    ${firstname}
    Input Text    name=testsurname    SP
    ${surname}=    Get Value    name=testsurname
    Input Text    name=testemail    komal.nevatia+part1996@gmail.com
    ${email}=    Get Value    name=testemail
    Log    ${email}
    Input Text    name=testpassword    testing1996
    Select checkbox    name=consent
    Click Button    name=testsignupSubmit-button
    Sleep    10s
    Current Frame Should Contain    Events
    Click Image    name=profileAccountSettings
    Click Element    name=editProfileItem
    ${email2}=    Get Value    name=email
    Log    ${email2}
    Run Keyword If    '${email2}'!='${email}'    Log    Account email correct
    ${fname2}=    Get Value    name=testfname
    Log    ${fname2}
    Run Keyword If    '${fname2}'=='${firstname}'    Log    Account firstname correct
    ${surname2}=    Get Value    name=testsurname
    Run Keyword If    '${surname}'=='${surname2}'    Log    Account surname correct

Login
    [Tags]    Tc8
    Open Browser    http://192.168.1.104:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia@gmail.com
    ${userid}=    Get Value    name=testemail
    Input Password    name=testpassword    testing2015
    Click Button    name=testloginSubmit-button
    Sleep    15s
    Current Frame Should Contain    Events
    Create Excel Document    doc_id=doc2
    Write Excel Cell    row_num=2    col_num=2    value=${userid}
    Save Excel Document    filename=file3.xlsx

Neg Scenario Email already exist
    Open Browser    http://192.168.1.104:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input text    name=testfname    Jan
    Input Text    name=testsurname    J
    Input Text    name=testemail    komal.nevatia+part1000@gmail.com
    Input Text    name=testpassword    testing1000
    Select checkbox    name=consent
    Click Button    name=testsignupSubmit-button
    Sleep    10s
    Current Frame Should Contain    Email is already used by another user
    Capture Page Screenshot    image.png

TC10_Mandatory_field_check_create_account
    Open Browser    http://192.168.1.104:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input text    name=testfname    Jan
    Input Text    name=testsurname    J
    Input Text    name=testemail    komal.nevatia+part1000@gmail.com
    Input Text    name=testpassword    testing1000
    Element Should Be Enabled    name=testsignupSubmit-button
    Log    Create Account Button Inactive

testing If
    ${a}    Set Variable    3
    Run Keyword If    ${a}==3    Log    C5ClickcHaPTname=name    Ca5sue

excel
    Create Excel Document    doc_id=doc1
    Write Excel Cell    row_num=1    col_num=1    value=ABC
    Save Excel Document    filename=file1.xlsx
    Close All Excel Documents

tc10_trial
    Open Browser    https://www.adzine.de/play-summit/    chrome
    Maximize Browser Window
    Click Image    class=db f-22 oswald fw2 pl-h pr-h ttu -purple link-white border-box link-underline -o-90

Edit Profile_Save_changes
    [Documentation]    Check if user is able to edit below fields on Edit Profile page and that the changes are reflected correctly on clicking Save
    ...    Name
    ...    Surname
    ...    Company
    ...    Job Title
    ...    Country
    ...    City
    ...    Phone
    [Tags]    tag12
    [Setup]    Start Browser and Login
    Wait Until Page Contains    text=Events
    Click Image    name=profileAccountSettings
    Click Element    name=editProfileItem
    Scroll Element Into View    name=testphone
    Capture Page Screenshot    image1.png
    ${firstname_original}=    Get Value    name=testfname
    Input Text    name=testfname    Ann
    ${surname_original}=    Get Value    name=testsurname
    Input Text    name=testsurname    Mia
    ${company_original}=    Get Value    name=testcompany
    Input Text    name=testcompany    Accenture
    ${job_original}=    Get Value    name=testjobTitle
    Input Text    name=testjobTitle    Data Architect
    ${country_original}=    Get Value    name=testcountry
    Input Text    name=testcountry    Fin
    ${city_original}=    Get Value    name=testcity
    Input Text    name=testcity    Helsinki
    ${phone_original}=    Get Value    name=testphone
    Input Text    name=testphone    +917930548906
    Capture Page Screenshot    img2.png
    Click Button    name=save-button
    Sleep    10s
    Click Element    name=editProfileItem
    ${firstname_edited}=    Get Value    name=testfname
    ${surname_edited}=    Get Value    name=testsurname
    ${company_edited}=    Get Value    name=testcompany
    ${job_edited}=    Get Value    name=testjobTitle
    ${country_edited}=    Get Value    name=testcountry
    ${city_edited}=    Get Value    name=testcity
    ${phone_edited}=    Get Value    name=testphone
    Capture Page Screenshot    img3.png
    Should Not Be Equal    ${firstname_edited}    ${firstname_original}
    Should Not Be Equal    ${surname_edited}    ${surname_original}
    Should Not Be Equal    ${company_edited}    ${company_original}
    Should Not Be Equal    ${job_edited}    ${job_original}
    Should Not Be Equal    ${country_edited}    ${country_original}
    Should Not Be Equal    ${city_edited}    ${city_original}
    Should Not Be Equal    ${phone_edited}    ${phone_original}
    Log    All changes made successfully

Edit Profile_Cancel
    [Documentation]    Check if user edits the below fields on Edit Profile page and clicks Cancel button, the changes should not get reflected.
    [Tags]    tag13
    [Setup]    Start Browser and Login
    Wait Until Page Contains    text=Events
    Click Image    name=profileAccountSettings
    Click Element    name=editProfileItem
    Scroll Element Into View    name=testphone
    Capture Page Screenshot    image1.png
    ${firstname_original}=    Get Value    name=testfname
    Input Text    name=testfname    Annita
    ${surname_original}=    Get Value    name=testsurname
    Input Text    name=testsurname    Sp
    ${company_original}=    Get Value    name=testcompany
    Input Text    name=testcompany    Sogeti
    ${job_original}=    Get Value    name=testjobTitle
    Input Text    name=testjobTitle    Architect
    ${country_original}=    Get Value    name=testcountry
    Input Text    name=testcountry    Finland
    ${city_original}=    Get Value    name=testcity
    Input Text    name=testcity    hel
    ${phone_original}=    Get Value    name=testphone
    Input Text    name=testphone    +917931548906
    Capture Page Screenshot    img2.png
    Click Button    name=cancel-button
    Click Element    name=editProfileItem
    ${firstname_edited}=    Get Value    name=testfname
    ${surname_edited}=    Get Value    name=testsurname
    ${company_edited}=    Get Value    name=testcompany
    ${job_edited}=    Get Value    name=testjobTitle
    ${country_edited}=    Get Value    name=testcountry
    ${city_edited}=    Get Value    name=testcity
    ${phone_edited}=    Get Value    name=testphone
    Capture Page Screenshot    img3.png
    Should Be Equal    ${firstname_edited}    ${firstname_original}
    Should Be Equal    ${surname_edited}    ${surname_original}
    Should Be Equal    ${company_edited}    ${company_original}
    Should Be Equal    ${job_edited}    ${job_original}
    Should Be Equal    ${country_edited}    ${country_original}
    Should Be Equal    ${city_edited}    ${city_original}
    Should Be Equal    ${phone_edited}    ${phone_original}
    Log    No changes reflected

Logout
    [Documentation]    Check if the user is able to Logout by clicking on Logout button
    [Tags]    tag14
    [Setup]    Start Browser and Login
    Wait Until Page Contains Element    css:search.search-events input
    Click Image    name=profileAccountSettings
    Capture Page Screenshot
    Click Element    name=logout-button
    Wait Until Page Contains    text=Log in to Deal Room    timeout=10s
    Capture Page Screenshot
    Log    Logout Successful

AddPartner
    [Documentation]    Check Event Organiser is able to add Partner to the Event.
    ...
    ...    Steps:
    ...    Login as Event organiser.
    ...    Click on the event
    ...    Go to Partner page
    ...    Click on Add Partner and fill all the fields and click Save
    ...    Partner profile should be created and should display details entered .
    [Tags]    tag16
    [Setup]    Start Browser and Login
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Click Button    name=add-partner
    Input Text    css:form.t-a-p input[name=testcompany-name]    Partner 22
    ${partner_name}=    Get Value    css:form.t-a-p input[name=testcompany-name]
    Input Text    css:form.t-a-p input[name=testbooth-location]    booth14
    Input Text    css:form.t-a-p input[name=testowner-name]    Olimoni
    Input Text    css:form.t-a-p input[name=testowner-surname]    Om
    Input Text    css:form.t-a-p input[name=testowner-email]    komal.nevatia+part5005@gmail.com
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
    [Setup]    Start Browser and Login
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Partner15
    Wait Until Page does not contain    Partner13
    Capture Page Screenshot

Organsier Can delete Partner
    [Documentation]    Check that Event organiser can delete the partner
    [Setup]    Start Browser and Login
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Partner 21
    Capture Page Screenshot
    Click Button    css:div.company-card button[name=testnull]
    Handle Alert
    Input Text    css:search.t-ps input    Partner 21
    Capture Page Screenshot

Participant Cannot Delete Partner
    [Documentation]    Check That Participant does not have option to Delete Partner
    ...
    ...    Steps:
    ...    Login as Participant
    ...    Go to Event, Click on Partner.
    ...    Check Delete button not present against the Partner
    [Setup]    Start Browser and Login as Participant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Partner15
    Page Should not contain Button     css:div.company-card button[name=testnull]
    Capture Page Screenshot

Participant can see Partner tab if Partner present
    [Documentation]    Check that if an event has any Partner added to it, the Partner tab should be visible to Participants.
    [Setup]    Start Browser and Login as Participant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Capture Page Screenshot
    Page Should contain element    name=partners

Participant cannot see Partner if no partner present
    [Documentation]    Check that if an event doesnt have any Partner added to it, the Partner tab should not be visible to Participants.
    [Setup]    Start Browser and Login as Participant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Capture Page Screenshot
    Page Should not contain element    name=partners

Organiser_Edit_Partner
    [Documentation]    Check that Event Organiser can Edit the Partner details
    [Setup]    Start Browser and Login
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Partner 20
    Wait Until Page does not contain    Partner13
    Capture Page Screenshot
    Click Element    css:div.t-b-det
    Click Button    css:button.t-edit-btn
    Input Text    css:form.t-e-p input[name=testname]    Partner
    Input Text    css:form.t-e-p input[name=testbooth-location]    newLoc
    Select From List by Value    css:form.t-e-p select[name=booth-rating]    2
    Input Text    css:form.t-e-p input[name=testwebsite]    nokia.com
    Input Text    css:form.t-e-p input[name=testaddress]    czc
    input Text    css:textarea.t-about    asnas
    Scroll element into view    css:form.t-e-p input[name=testname]
    Capture Page Screenshot
    click button    name=testsave-button
    Click Element    name=partners
    Input Text    css:search.t-ps input    newPartner
    Capture Page Screenshot

Participant cannot edit Partner
    [Setup]    Start Browser and Login as Participant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Partner 21
    Wait Until Page does not contain    Partner13
    Capture Page Screenshot
    Click Element    css:div.t-b-det
    Page should not contain Button    css:button.t-edit-btn

Add Sponsor
    [Documentation]    Check Event Organiser is able to add Sponsor to the Event.
    ...
    ...    Steps:
    ...    Login as Event organiser.
    ...    Click on the event
    ...    Go to Sponsor page
    ...    Click on Add Sponsor and fill all the fields and click Save
    ...    Sponsor profile should be created and should display details entered .
    [Setup]    Start Browser and Login
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-sponsors a
    Capture Page Screenshot
    Click Button    name=add-partner
    Input Text    css:form.t-a-p input[name=testcompany-name]    Sponsor61
    ${sponsor_name}=    Get Value    css:form.t-a-p input[name=testcompany-name]
    Input Text    css:form.t-a-p input[name=testbooth-location]    booth14
    Input Text    css:form.t-a-p input[name=testowner-name]    Olimoni
    Input Text    css:form.t-a-p input[name=testowner-surname]    Om
    Input Text    css:form.t-a-p input[name=testowner-email]    komal.nevatia+part5005@gmail.com
    Select From List By Value    css:form.t-a-p select[name=rating]    2
    Select Checkbox    css:form.t-a-p input[name=agenda-enabled]
    Click Button    name=testsave-button
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    ${sponsor_name}
    Wait Until Page does not contain    Partner13
    Capture Page Screenshot

User can Search Sponsor
    [Documentation]    Check if the user is able to search Sponsor on Sponsor page.
    ...
    ...    Steps:
    ...    Login as Organiser / Participant and select an Event that has partners added to it
    ...    Go to Sponsor page and enter Sponsor name in Search option and check if search results are correct.
    [Setup]    Start Browser and Login
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:li.t-sponsors a
    Click Element    css:li.t-sponsors a
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    Sponsor15
    Wait Until Page Contains    Sponsor15
    Capture Page Screenshot

Organsier Can Delete Sponsor
    [Documentation]    Check that Event Organiser is able to Delete the Sponsor
    ...
    ...    Steps
    ...    Login as Event Organiser.
    ...    Go the Event, Click on the Sponsor tab
    ...    Serach for the particular sponsor and click on Delete button
    [Setup]    Start Browser and Login
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-sponsors a
    Input Text    css:search.t-ps input    Sponsor61
    Capture Page Screenshot
    Click Button    css:div.company-card button[name=testnull]
    Handle Alert
    Input Text    css:search.t-ps input    Sponsor61
    Capture Page Screenshot

Participant cannot delete Sponsor
    [Documentation]    Login as participant and check that Particpant does not have option to Delete the Sponsor
    [Setup]    Start Browser and Login
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    css:li.t-sponsors a
    Input Text    css:search.t-ps input    Sponsor61
    Capture Page Screenshot
    Page Should not contain Button    css:div.company-card button[name=testnull]
    Capture Page Screenshot

Participant can see Sponsor tab if Sponsor present
    [Documentation]    Check that if \ Sponsors have been added to the event, then Participant should \ be able to see Sponsor tab
    [Setup]    Start Browser and Login as Participant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Page Should contain Element    css:li.t-sponsors a

Participant cannot see Sponsor tab if Sponsor not added
    [Documentation]    Check that if no Sponsors have been added to the event, then Participant should not be able to see Sponsor tab
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Page Should not contain Element    css:li.t-sponsors a
    Capture Page Screenshot

Participant can send Meeting invite to Partner
    [Setup]    Start Browser and Login as Participant
    Wait Until Page Contains Element    css:search.search-events input
    Input Text    css:search.search-events input    event9
    Wait Until Page Contains Element    class=event-name
    Click Element    class=event-name
    Wait Until Page Contains Element    css:search.pull-left input
    Click Element    name=partners
    Wait Until Page Contains Element    css:search.t-ps input
    Input Text    css:search.t-ps input    newPartner
    Wait Until Page does not contain    Partner13
    Click Button    css:button.t-m-btn
    Click button    css:div.modal-body button[name=testnull]

tr
    [Setup]    Start Browser and Login
    Wait Until Page Contains Element    css:search.search-events input
    Sleep    10s
    Click Element    css:li.active i

*** Keywords ***
open
    Open Browser    https://console.dealroomevents.com/pub/d/login    chrome

openwitharg
    [Arguments]    ${url}
    Open Browser    ${url}    chrome

test browser
    [Arguments]    ${url}
    Open Browser    ${url}    chrome

Display Message
    [Arguments]    ${msg}
    Log    ${msg}

Start Browser and Login
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia@gmail.com
    Input Password    name=testpassword    testing2015
    Click Button    name=testloginSubmit-button
    Sleep    6s

Start Browser and Login as Participant
    Open Browser    http://192.168.1.100:4444/pub/d/login?redirectUrl=%2F    chrome
    Maximize Browser Window
    Input Text    name=testemail    komal.nevatia+part5009@gmail.com
    Input Password    name=testpassword    testing5009
    Click Button    name=testloginSubmit-button
    Sleep    10s
