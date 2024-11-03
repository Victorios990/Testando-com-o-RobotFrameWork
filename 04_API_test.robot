*** Settings ***
Library    RequestsLibrary 
Library    String
Library    Collections
Library    faker
Resource    resources/api_testing_usuarios.resource

*** Test Cases ***
Criar um novo usuário utilizando as variaveis aleatorias
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    email=${novo_email}  status_code_desejado=201

*** Variables ***
${random_string}    fakerlibrary
${password}         Generate Random String    [NUMBERS]
${url}              url=https://serverest.dev


*** Keywords ***
Criar um usuário novo
    Set Test Variable    ${random_string}    
    ${random_string}    Convert To Lower Case    ${random_string}
    Set Test Variable    ${novo_email}    ${random_string}@apitest.com
    Log To Console    ${novo_email}
    ${header}    Create Dictionary    accept=json    content-Type=application/json
    Create Session    alias=serverest    url=https://serverest.dev    headers=${header}

Cadastrar o usuário criado na ServeRest
    [Arguments]  ${email}  ${status_code_desejado}
    ${body}    Create Dictionary
    ...        nome=${random_string}
    ...        email=${email}
    ...        password=${password}
    ...        administrador=${True}
    Log        ${body}

    Criar Sessão na ServeRest

    ${resposta}    POST On Session
    ...             alias=ServeRest
    ...             url=/usuarios
    ...             json=${body}
    ...             expected_status=${status_code_desejado}
    Log  ${resposta.json()}
    Set Test Variable    ${ID_USUARIO}  ${resposta.json()["_id"]}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}


Criar Sessão na ServeRest
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev   headers=${headers}

Confirmar se o cadastro foi realizado com sucesso
    Log    ${resposta}
    Dictionary Should Contain Item    ${resposta}    message    Cadastro Realizado!
    Dictionary Should Contain Key   ${resposta}   ${OUTPUT_DIR}

Realizar Login
    ${body}    Create Dictionary    email=${novo_email}    password=${password}

    ${resposta}    POST On Session
    ...            alias=Serverest
    ...            url=usuarios
    ...            json=${body}
    ...            expected_status=201

    Set Test Variable    ${resposta}    ${resposta.json()}

Conferir login realizado
    Log To Console    ${resposta}
    Dictionary Should Contain Item    dictionary=${resposta}    key=message    value=Login Realizado!!
    Dictionary Should Contain Key    dictionary=${resposta}    key=authorization

