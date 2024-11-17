*** Settings ***
Resource            ../projectObjects_Test_EX/HomePage.robot
Resource            ../projectObjects_Test_EX\Resource.robot
Resource            ../projectObjects_Test_EX\PageAccount.robot
Test Setup          Open Browser
Test Teardown       Close Browser

*** Test Cases ***
Caso de Teste com PO 02: Adicionar Cliente
    HomePage.Acessar a página home do site
    HomePage.Clicar em "Sign in"
    HomePage.Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Assinar a Newsletter
    Submeter cadastro
    
Conferir se o cadastro foi efetuado com sucesso
    Conferir se o cadastro foi efetuado com sucesso