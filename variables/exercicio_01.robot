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
    FOR    ${key}    IN    @{PESSOA.keys()}
        Log To Console    ${key}: ${PESSOA["${key}"]}        
    END
    Log To Console    ${\n}


Imprimir as frutas
    Log List          ${FRUTAS}

    Sort List         ${FRUTAS}
    Log To Console    ${\n}
    FOR    ${INDEX}   ${FRUTA}    IN ENUMERATE  @{FRUTAS}
        Log To Console    ${INDEX}: ${FRUTA}    
    END
    Log To Console    ${\n}
