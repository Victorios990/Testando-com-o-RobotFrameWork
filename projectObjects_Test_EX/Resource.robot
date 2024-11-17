*** Settings ***
Library    SeleniumLibrary
Library    String
Library    AppiumLibrary
Resource   HomePage.robot
Resource   PageAccount.robot

*** Variables ***
${BROWSER}       firefox

*** Keywords ***
Abrir navegador
    Open Browser    ${BROWSER}
    Maximize Browser Window

#Fechar navegador
#    Close Browser
