*** Settings ***
Library          Collections
Documentation    Exercício sobre o uso de estruturas de repetição usando FOR e estruturas condicionais usando IF-ELSE

*** Variables ***
${LIMITE}=    5
@{PAISES}=    Alemanha    França    Espanha    Itália    Portugal    Brasil

*** Test Cases ***
Teste de Looping FOR para contagem    
    Imprimir os Números de 0 a ${LIMITE}
    Imprimir os Números de ${LIMITE} a ${LIMITE}**2

Teste de Looping FOR para listagem
    Imprimir a Lista de Países    

*** Keywords ***
Imprimir os Números de ${LIMITE_INFERIOR} a ${LIMITE_SUPERIOR}
    Log To Console    ${\n}
    FOR    ${counter}    IN RANGE    ${LIMITE_INFERIOR}    ${LIMITE_SUPERIOR}+1
        IF    ${counter} % 2 == 0
            Log To Console    Estou no número ${counter} de ${LIMITE_INFERIOR} a ${LIMITE_SUPERIOR}, e o número é par
        ELSE
            Log To Console    Estou no número ${counter} de ${LIMITE_INFERIOR} a ${LIMITE_SUPERIOR}, e o número é ímpar
        END

    END

Imprimir a Lista de Países
    Sort List         ${PAISES}
    Log To Console    ${\n}
    FOR    ${pais}    IN    @{PAISES}
        IF    "${pais}" == "Brasil"
            Log To Console    ${pais}, a Colônia
        ELSE IF    "${pais}" == "Portugal"
            Log To Console    ${pais}, a Metrópole
        ELSE
            Log To Console    ${pais}    
        END
        
    END