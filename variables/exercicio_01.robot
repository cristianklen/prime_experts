*** Settings ***
Documentation    Primeiro exercício: Variáveis
Library          Collections

*** Variables ***
&{PESSOA}        nome=Cristian    sobrenome=Klen    cidade=Rio de Janeiro    email=cristian.klen@gmail.com    linkedin=linkedin.com/in/cristianklen    twitter=@CristianKlen    github=github.com/cristianklen
@{FRUTAS}        Cupuaçú    Graviola    Jabuticaba    Açaí    Jamelão

*** Test Cases ***
Teste de impressão dos dados pessoais no Console
    Imprimir os dados pessoais

Teste de impressão das frutas no Console
    Imprimir as frutas

*** Keywords ***
Imprimir os dados pessoais
    Log Dictionary    ${PESSOA}
    ${keys} =	Get Dictionary Keys	${PESSOA}    sort_keys=False
    Log To Console    ${\n}
    Log To Console    ${keys}[0]: ${PESSOA.${keys[0]}}
    Log To Console    ${keys}[1]: ${PESSOA.${keys}[1]}
    Log To Console    ${keys}[2]: ${PESSOA.${keys}[2]}
    Log To Console    ${keys}[3]: ${PESSOA.${keys}[3]}
    Log To Console    ${keys}[4]: ${PESSOA.${keys}[4]}
    Log To Console    ${keys}[5]: ${PESSOA.${keys}[5]}
    Log To Console    ${keys}[6]: ${PESSOA.${keys}[6]}    
    Log To Console    ${\n}


Imprimir as frutas
    Log List          ${FRUTAS}
    Log To Console    ${\n}
    Sort List         ${FRUTAS}
    Log To Console    ${FRUTAS}[0] 
    Log To Console    ${FRUTAS}[1] 
    Log To Console    ${FRUTAS}[2]
    Log To Console    ${FRUTAS}[3] 
    Log To Console    ${FRUTAS}[4] 
    Log To Console    ${\n}
