*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***
${URL}                  https://www.amazon.com.br
${ID_CAMPO_PESQUISA}    twotabsearchtextbox
${ID_BOTÃO_PESQUISA}    nav-search-submit-button
${PRODUTO}              Xbox Series S

*** Test Cases ***
Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Abrir o navegador
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Fechar o pedido
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Abrir o navegador.
    Acessar a home page do site Amazon.com
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa.
    Clicar no botão de pesquisa.
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S".
    Adicionar o produto "Console Xbox Series S" no carrinho.
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso.
    Remover o produto "Console Xbox Series S" do carrinho.
    Verificar se o carrinho fica vazio.

*** Keywords ***
Abrir o navegador
    Open Browser    browser=firefox
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}

Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Input Text    locator=${ID_CAMPO_PESQUISA}    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Button    locator=${ID_BOTÃO_PESQUISA}

Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')]

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')]
    Click Button    locator=add-to-cart-button

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//h1[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]

Fechar o pedido
    Click Element    locator=//input[contains(@name,'proceedToRetailCheckout')]


# Caso de Teste 04 - Remover Produto do Carrinho

Abrir o navegador.
    Abrir o navegador
Acessar a home page do site Amazon.com
    Acessar a home page do site Amazon.com.br

Digitar o nome de produto "Xbox Series S" no campo de pesquisa.
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa

Clicar no botão de pesquisa.
    Clicar no botão de pesquisa

Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S".
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

Adicionar o produto "Console Xbox Series S" no carrinho.
    Adicionar o produto "Console Xbox Series S" no carrinho

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso.
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Remover o produto "Console Xbox Series S" do carrinho.
    Click Element    locator=//a[contains(@data-csa-c-type,'button')]
    Capture Page Screenshot
    Click Button    locator=//input[contains(@data-feature-id,'item-delete-button')]

Verificar se o carrinho fica vazio.
    Wait Until Element Is Visible    locator=//h2[@class='a-size-extra-large a-spacing-mini a-spacing-top-base a-text-normal'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]