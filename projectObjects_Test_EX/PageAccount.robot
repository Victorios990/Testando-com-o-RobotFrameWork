*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Informar um e-mail válido
    Click Button    locator=email_create
    Input Text    locator=email_create    text=victor@teste.com
    Click Button    locator=id=SubmitCreate