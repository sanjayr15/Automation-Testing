*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Verify Page Loaded
    wait until page contains    Back to results
Add to Cart
    click Button  id="add-to-cart-button"