*** Settings ***

Resource    ../Resources/PO/Landingpage.robot
Resource    ../Resources/PO/topnav.robot
Resource    ../Resources/PO/searchresults.robot
Resource    ../Resources/PO/product.robot
Resource    ../Resources/PO/cart.robot
Resource    ../Resources/PO/signin.robot

*** Keywords ***

Search for Products
    Landingpage.Load
    Landingpage.Verify Page Loaded
    topnav.Search for Products
    searchresults.verify search Completed


Select Product from search Results
    searchresults.Click Product link
    product.Verify Page Loaded

Add Product to Cart
    product.Add to Cart
    cart.Verify Product Added

Begin Checkout
    cart.Proceed to Checkout
    signin.Verify Page Loaded