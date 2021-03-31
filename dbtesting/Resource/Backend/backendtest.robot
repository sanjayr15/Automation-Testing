*** Settings ***
Library    OperatingSystem
Library    MongoDBLibrary
Library    String
Library    Collections


*** Variables ***

*** Keywords ***
access data from backend
    [Tags]    count
    ${On-Hold}       retrieve some mongodb records    workflow    v_agg_project    {"_id":"On-Hold"}
    @{on-Hold-1}  split string  ${On-Hold}
    ${on-Hold-count}  get from list  ${on-Hold-1}  3
    #log many    @{On-Hold-1}
    ${In-Progress}       retrieve some mongodb records    workflow    v_agg_project    {"_id":"In-Progress"}
    @{In-Progress-1}  split string  ${In-Progress}
    ${In-Progress-count}  get from list  ${In-Progress-1}  3
    ${Open}       retrieve some mongodb records    workflow    v_agg_project    {"_id":"Open"}
    @{Open-1}  split string  ${Open}
    ${Open-count}  get from list  ${Open-1}  3
    ${Delayed}       retrieve some mongodb records    workflow    v_agg_project    {"_id":"Delayed"}
    @{Delayed-1}  split string  ${delayed}
    ${Delayed-count}  get from list  ${Delayed-1}  3
    @{backenddata} =  create list    ${On-Hold-count}  ${In-Progress-count}  ${Open-count}  ${Delayed-count}
    [Return]    @{backenddata}

