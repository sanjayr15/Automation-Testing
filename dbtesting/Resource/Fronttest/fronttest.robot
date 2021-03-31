*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_EMAIL_FIELD} =  xpath=//*[@id="input-54"]
${LOGIN_PASS_FIELD} =   xpath=//*[@id="input-57"]
${LOGIN_BUTTON} =       css=#app > div > div > div > main > div > div > div > div > form > div > div.v-card__actions > div > button.v-btn.v-btn--is-elevated.v-btn--has-bg.theme--light.v-size--default.primary

*** Keywords ***

Loging into the webpage
    open browser
    go to    ${URL}
    input text      ${LOGIN_EMAIL_FIELD}    ${EMAIL}
    input text      ${LOGIN_PASS_FIELD}     ${PASSWORD}
    click button    ${LOGIN_BUTTON}
    wait until page contains    Open
    log    Login Sucessfull
    sleep  10s

Collecting the data
    ${OPEN} =             get text    xpath=//*[@id="app"]/div/div/div/main/div/div/div/div/div[1]/div[1]/div/div[1]/div[2]/div/div
    ${In-Progress} =      GET TEXT    xpath=//*[@id="app"]/div/div/div/main/div/div/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div
    ${DELAYED} =          GET TEXT    xpath=//*[@id="app"]/div/div/div/main/div/div/div/div/div[1]/div[3]/div/div[1]/div[2]/div/div
    ${ON-HOLD} =          GET TEXT    xpath=//*[@id="app"]/div/div/div/main/div/div/div/div/div[1]/div[4]/div/div[1]/div[2]/div/div
    @{counts} =           create list    ${ON-HOLD}  ${In-Progress}  ${Open}  ${Delayed}
    [Return]              @{counts}
