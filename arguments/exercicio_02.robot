
*** Settings ***
Library          Collections
Library          String
Documentation    Exercício - Argumentos e Retornos:
...              Crie uma keyword que cria um e-mail formado por nome_sobrenome_idade@robot.com, onde o nome, o sobrenome e a idade 
...              são recebidos via passagem de argumentos e, ao final, a keyword deve retornar esse e-mail formatado. 
...              Imprima o e-mail retornado no console.

*** Variables ***
&{DADOS_EMAIL_CRISTIAN}=      nome=Cristian      sobrenome=Klen      idade=45
&{DADOS_EMAIL_ALESSANDRA}=    nome=Alessandra    sobrenome=Vieira    idade=38
&{DADOS_EMAIL_FLAVIA}=        nome=Flavia        sobrenome=Klen      idade=44
&{DADOS_EMAIL_ATUTR}=         nome=Artur         sobrenome=Vieira    idade=5
@{DADOS_EMAIL}                ${DADOS_EMAIL_CRISTIAN}    ${DADOS_EMAIL_ALESSANDRA}    ${DADOS_EMAIL_FLAVIA}    ${DADOS_EMAIL_ATUTR}

*** Test Cases ***
Imprimir e-mail no Console
    ${email} =        Gerar Email    Cristian    Klen    45
    Log To Console    ${\n}
    Log To Console    ${email}
    Log To Console    ${\n}

Imprimir lista de e-mails no Console
    ${lista_emails}=      Gerar Lista de Emails      ${DADOS_EMAIL}
    
    Sort List         ${lista_emails}
    Log To Console    ${\n}
    FOR    ${INDEX}   ${EMAIL}    IN ENUMERATE  @{lista_emails}
        Log To Console    ${INDEX}: ${EMAIL}    
    END
    Log To Console    ${\n}    

*** Keywords ***
Gerar Email
    [Arguments]    ${NOME}    ${SOBRENOME}    ${IDADE}
    
    ${EMAIL_FORMATADO}=    Convert To Lower Case    ${NOME}_${SOBRENOME}_${IDADE}@robot.com
    
    [Return]       ${EMAIL_FORMATADO}
  

Gerar Lista de Emails
    [Arguments]    ${LISTA_DICIONARIOS}
    
    @{LISTA_EMAILS}=    Create List
    FOR    ${INDEX}   ${DADOS_EMAIL}    IN ENUMERATE  @{LISTA_DICIONARIOS}        
        ${EMAIL} =    Gerar Email    ${DADOS_EMAIL.nome}    ${DADOS_EMAIL.sobrenome}    ${DADOS_EMAIL.idade}
        Insert Into List	${LISTA_EMAILS}    ${INDEX}    ${EMAIL}
    END

    [Return]    ${LISTA_EMAILS}
