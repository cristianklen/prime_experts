*** Settings ***
Documentation    Meu teste de variáveis

*** Variables ***
${MENSAGEM}      Hello Word!!
${NUMERO}        ${10}
${BOOLEAN}       ${true}

*** Test Cases ***
Meu teste de impressão de mensagem no terminal
    Logar no meu terminal uma mensagem    


*** Keywords ***
Logar no meu terminal uma mensagem
    Log To Console    ${\n}
    Log To Console    ${MENSAGEM}

