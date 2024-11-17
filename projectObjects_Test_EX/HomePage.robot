*** Settings ***
Library    SeleniumLibrary
Library    String
Library    RequestsLibrary

*** Variables ***
${URL}                     http://www.automationpractice.pl/index.php
${HOME_TITLE}              My Shop
${HOME_BUTTON_SIGN}        //a[@class='login'][contains(.,'Sign in')]
${Email}                   victor@teste.com
${GenderSr}                id_gender1
${GenderSra}               id_gender2
${BoxInputFirsName}        customer_firstname
${FirstName}               Victor
${BoxInputLastName}        customer_lastname
${LastName}                Almeida
${BoxPasswd}               passwd
${Passwd}                  123456
${BoxDayOfBirth}           days
${DayBirth}                //option[@value='11'][contains(.,'11')]
${BoxMonthOfBirth}         months
${MothBirth}               (//option[contains(@value,'4')])[4]
${BoxYearsOfBirth}         years
${YearOfBirth}             //option[@value='1990'][contains(.,'1990')]
${Newsletter}              newsletter
${BoxEmailRegistered}      email
${BoxPwdEmailRegistered}   passwd


*** Keywords ***
Acessar a página home do site
    Go To    url=${URL}
    Maximize Browser Window
    Title Should Be    ${HOME_TITLE}
    Set Selenium Implicit Wait    value=5

Clicar em "Sign in"
    Click Element    locator=${HOME_BUTTON_SIGN}

Informar um e-mail válido
    Click Button    locator=email_create
    Input Text    locator=email_create    text=${Email}

Clicar em "Create an account"
    Click Button    locator=id=SubmitCreate

Preencher os dados obrigatórios
    Click Button    locator=${GenderSr}
    Click Button    locator=${BoxInputFirsName}
    Input Text    locator=${BoxInputFirsName}   text=${FirstName}
    Click Button    locator=${BoxInputLastName}
    Input Text    ${BoxInputLastName}    text=${LastName}
    Click Button    locator=${BoxPasswd}
    Input Password    ${BoxPasswd}    password=${Passwd}
    Click Element    locator=${BoxDayOfBirth}
    Click Element    locator=${DayBirth}
    Click Element    locator=${BoxMonthOfBirth}
    Click Element    locator=${MothBirth}
    Click Element    locator=${BoxYearsOfBirth}
    Click Element    locator=${YearOfBirth}
Assinar a Newsletter
    Click Element    locator=${Newsletter}
   
Submeter cadastro
    Click Button    locator=submitAccount
    Capture Page Screenshot

Conferir se o cadastro foi efetuado com sucesso
    Acessar a página home do site
    Clicar em "Sign in"
    #Click Element    locator=${BoxEmailRegistered}
    Input Text    locator=${BoxEmailRegistered}    text=${Email}
    #Click Element    locator=${BoxPwdEmailRegistered}
    Input Password    locator=${BoxPwdEmailRegistered}    password=${Passwd}
    Element Should Be Visible    locator=SubmitLogin
    Click Button    locator=SubmitLogin
    Capture Page Screenshot
    Close Browser