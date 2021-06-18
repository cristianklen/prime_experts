*** Settings ***
Documentation            Recurso de definição das Keywords que utilizam os elementos da Page SEARCH
Library                  SeleniumLibrary
Resource                 ../Commom.robot
Variables                ../locators/header_locators.py
Variables                ../locators/search_locators.py

*** Keywords ***

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible          ${SEARCH}[botao_comparar]        timeout=${TIMEOUT}
    ${produto}         Get Text            ${SEARCH}[links_nomes_produto]
    Should Be True    '${PRODUTO}' == '${produto}' 

Adicionar o produro "${PRODUTO}" no carrinho
    Mouse Over                        ${SEARCH}[links_nomes_produto]
    Click Element                     ${SEARCH}[botao_adicionar_ao_carrinho]
    Wait Until Element Is Visible     ${SEARCH}[botao_ir_para_o_carrinho]    timeout=${TIMEOUT}
    #Click Element                     ${SEARCH}[botao_ir_para_o_carrinho]

Conferir se o produto "${PRODUTO}" foi adicionado ao carrinho
    Wait Until Element Is Visible     ${SEARCH}[div_info_produto]    timeout=${TIMEOUT}
    Page Should Contain               ${SEARCH}[texto_msg_sucesso]
    Element Should Contain            ${SEARCH}[nome_produto]        ${PRODUTO}

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                        ${HEADER}[campo_pesquisa]    ${PRODUTO}

Conferir mensagem "${MENSAGEM}"
    Wait Until Element Is Visible     ${SEARCH}[mensagem_nenhum_resultado_encontrado]    timeout=${TIMEOUT}
    Element Should Contain            ${SEARCH}[mensagem_nenhum_resultado_encontrado]    ${MENSAGEM}