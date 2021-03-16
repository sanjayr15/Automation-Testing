*** Setting ***
Library    SeleniumLibrary

*** Variables ***
${SIGNIN_MAIN_HEADING} =  XPath=//h1

*** Keywords ***

Verify Page Loaded
    PAGE SHOULD CONTAIN ELEMENT    ${SIGNIN_MAIN_HEADING}
    element text should be    ${SIGNIN_MAIN_HEADING}  Sign In