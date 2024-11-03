# 1 - Crie um arquivo de teste novo;
# 2 - Cria uma nova keyword, onde ela nos produzirá um e-mail customizado com as seguintes regras:
# Essa keyword deve receber por argumento o nome e sobrenome de uma pessoa
# Essa keyword deve gerar uma palavra aleatória que será usada na composição do e-mail (DICA: olhe na documentação da Library String ou Library Faker para achar 
# uma keyword que gere essa palavra aleatória)
# Junte o nome + sobrenome + palavra aleatória + @testerobot.com e retorne esse e-mail montado ao final da keyword. Exemplo: MayFernandesWedd34Dd@testerobot.com
# 3 - Crie um teste que vai chamar essa keyword, passar os argumentos esperados e armazenar o valor retornado em uma nova variável simples;
# 4 - Faça um Log To Console para imprimir essa variável simples.
#########################    SEGUNDO TESTE    #################################
# 1 - Crie um arquivo de teste novo;
# 2 - Crie uma variável do tipo DICIONÁRIO na seção de variáveis globais que contenha nela os meses do ano e, para cada mês, informe o número de dias desse mês;
# 3 - Crie um teste que imprima no Console (Log To Console) cada mês e a sua respectiva quantidade de dias.
# 4 - Rode os testes e confira se logou tudo certinho!

*** Settings ***
Library    String
Library    

*** Variables ***
&{USUARIO}    nome=Victor    sobrenome=Almeida    dominio_email=@testerobot.com
&{mes_dia}    Janeiro=31    Fevereiro=29    Março=31    Abril=30    Maio=31    Junho=30    Julho=31    Agosto=31    Setembro=30    Outubro=31    Novembro=30    Dezembro=31

*** Test Cases ***
Caso de teste 01 - Crie uma nova keyword, onde ela nos produzirá um e-mail customizado
    ${EMAIL_CRIADO}    Criar email    ${USUARIO.nome}    ${USUARIO.sobrenome}
    Log To Console     ${EMAIL_CRIADO}

Crie um teste que imprima no Console cada mês e a sua respectiva quantidade de dias.
    Log To Console    O mês de Janeiro tem ${mes_dia.Janeiro} dias!
    Log To Console    O mês de Fevereiro tem ${mes_dia.Fevereiro} dias!
    Log To Console    O mês de Março tem ${mes_dia.Março} dias!
    Log To Console    O mês de Abril tem ${mes_dia.Abril} dias!
    Log To Console    O mês de Maio tem ${mes_dia.Maio} dias!
    Log To Console    O mês de Junho tem ${mes_dia.Junho} dias!
    Log To Console    O mês de Julho tem ${mes_dia.Julho} dias!
    Log To Console    O mês de Agosto tem ${mes_dia.Agosto} dias!
    Log To Console    O mês de Setembro tem ${mes_dia.Setembro} dias!
    Log To Console    O mês de Outubro tem ${mes_dia.Outubro} dias!
    Log To Console    O mês de Novembro tem ${mes_dia.Novembro} dias!
    Log To Console    O mês de Dezembro tem ${mes_dia.Dezembro} dias!

*** Keywords ***
Criar email
    [Arguments]   ${USUARIO.nome}    ${USUARIO.sobrenome}  
    ${PALAVRA_ALEATORIA}    Generate Random String
    ${EMAIL_FINAL}    Set Variable    ${USUARIO.nome}    ${USUARIO.sobrenome}    ${PALAVRA_ALEATORIA}    ${USUARIO.dominio_email}
    [Return]    ${EMAIL_FINAL}
