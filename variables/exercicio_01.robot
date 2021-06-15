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
    ${keys} =	Get Dictionary Keys    ${PESSOA}    sort_keys=False
    ${values} =	Get Dictionary Values   ${PESSOA}    sort_keys=False
    
    Log To Console    ${\n}
    Log To Console    ${keys}[0]: ${values}[0]
    Log To Console    ${keys}[1]: ${values}[1]
    Log To Console    ${keys}[2]: ${values}[2]
    Log To Console    ${keys}[3]: ${values}[3]
    Log To Console    ${keys}[4]: ${values}[4]
    Log To Console    ${keys}[5]: ${values}[5]
    Log To Console    ${keys}[6]: ${values}[6]    
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
