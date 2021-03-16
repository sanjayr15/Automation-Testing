*** Settings ***
Documentation    This is some basic info about the whole suite

Resource    ../Resources/common.robot
Resource    ../Resources/Amazon.robot
Test Setup  common.Begin Web Test
Test Teardown  common.End Web Test

*** Variables ***

${BROWSER} =  safari
${START_URL} =  http://www.amazon.in
${SEARCH_TERM} =  samsung a71

*** Test Cases ***
Logged out user should be able to search for products
    [Tags]    Smoke
    Amazon.Search for Products

Logged out user should be able to view a product
    [Tags]    Smoke
    Amazon.Search for Products
    Amazon.Select Product from Search Results

Logged out user should be able to add product to cart
    [Tags]    Smoke
    Amazon.Search for Products
    Amazon.Select Product from Search Results
    Amazon.Add Product to Cart

Logged out user should be asked to sign in to check out
    [Tags]    Smoke
    Amazon.Search for Products
    Amazon.Select Product from Search Results
    Amazon.Add Product to Cart
    Amazon.Begin Checkout

*** Keywords ***
