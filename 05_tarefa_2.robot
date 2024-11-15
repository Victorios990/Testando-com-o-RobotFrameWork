*** Settings ***
Library    ./05_1_bibliotecaDoZe.py

*** Variables ***
${CONTEUDO}    Victor Almeida
${ARQUIVO}    C:\Users\55619\Documents\Rumo a Primeira Vaga\QA\RobotFramework Avançado\modulo_4_libraries_customizadas\MyCustomLibraries_hash\MyCustomLibraries\arquivo_PDF.pdf

*** Test Cases ***
Teste de conversao de string para Hash SHA256
    converter ${CONTEUDO} para SHA256

converter o arquivo para SHA256
    converter o ${ARQUIVO} para SHA256
 

*** Keywords ***
converter ${CONTEUDO} para SHA256
    ${CONTEUDO_HASH}    Obter Hash    ${CONTEUDO}
    LOG    ${CONTEUDO_HASH}

converter o arquivo para SHA256
    ${CONTEUDO_HASH}    Obter Hash    ./${ARQUIVO} 
    Log   ${CONTEUDO_HASH}