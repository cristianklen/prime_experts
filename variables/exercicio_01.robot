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
    Log To Console    ${\n}
    Log To Console    Nome: ${PESSOA.nome} ${PESSOA.sobrenome}
    Log To Console    Cidade: ${PESSOA.cidade}
    Log To Console    e-mail: ${PESSOA.email}
    Log To Console    LinkedIn: ${PESSOA.linkedin}
    Log To Console    GitHub: ${PESSOA.github}
    Log To Console    Twitter: ${PESSOA.twitter}    
    Log To Console    ${\n}

Imprimir as frutas
    Log List          ${FRUTAS}
    Log To Console    ${\n}
    Log To Console    ${FRUTAS}[3] 
    Log To Console    ${FRUTAS}[0] 
    Log To Console    ${FRUTAS}[1]
    Log To Console    ${FRUTAS}[2] 
    Log To Console    ${FRUTAS}[4] 
    Log To Console    ${\n}