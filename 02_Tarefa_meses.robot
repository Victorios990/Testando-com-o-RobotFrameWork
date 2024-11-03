# 1 - Crie um arquivo de teste novo;
# 2 - Crie uma variável do tipo LISTA na seção de variáveis globais que contenha todos os meses do ano;
# 3 - Crie um teste que imprima no Console (Log To Console) cada item dessa lista (não use FOR, imprima um a um).
# 4 - Rode os testes e confira se logou tudo certinho!
# Perguntas dessa tarefa
# Como você implementou? Conta pra gente! Cole os trechos do código criados/alterados.

*** Settings ***

Library    String

*** Variables ***
@{meses_ano}    Janeiro    Fevereiro    Março    Abril    Maio    Junho    Julho    Agosto    Setembro    Outubro    Novembro    Dezembro


*** Test Cases ***
Imprima todos os meses do ano!
    Log To Console  Imprimir os meses do ano${meses_ano[0]}
    Log To Console  Imprimir os meses do ano${meses_ano[1]}
    Log To Console  Imprimir os meses do ano${meses_ano[2]}
    Log To Console  Imprimir os meses do ano${meses_ano[3]}
    Log To Console  Imprimir os meses do ano${meses_ano[4]}
    Log To Console  Imprimir os meses do ano${meses_ano[5]}
    Log To Console  Imprimir os meses do ano${meses_ano[6]}
    Log To Console  Imprimir os meses do ano${meses_ano[7]}
    Log To Console  Imprimir os meses do ano${meses_ano[8]}
    Log To Console  Imprimir os meses do ano${meses_ano[9]}
    Log To Console  Imprimir os meses do ano${meses_ano[10]}
    Log To Console  Imprimir os meses do ano${meses_ano[11]}
