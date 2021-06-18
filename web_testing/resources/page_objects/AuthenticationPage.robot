*** Settings ***
Documentation            Recurso de definição das Keywords que utilizam os elementos da Page AUTHENTICATION
Library                  SeleniumLibrary
Resource                 ../Commom.robot
Variables                ../locators/header_locators.py
Variables                ../locators/authentication_locators.py
Variables                ../data/usuario.py

*** Keywords ***
Clicar em "Sign in"
    Click Link                       ${HEADER}[menu_signin]    

Informar um e-mail válido
    Wait Until Element Is Visible    ${AUTH}[botao_criar_conta]      timeout=${TIMEOUT}
    ${id}                            Gerar Identificador Único
    Input Text                       ${AUTH}[input_email]            ${USUARIO}[nome]_${id}@gmail.com

Clicar em "Create an account"
    Click Element                    ${AUTH}[botao_criar_conta]

Preencher os dados obrigatórios
    Wait Until Element Is Visible    ${AUTH}[input_empresa]          timeout=${TIMEOUT}
    #Title
    Click Element                    ${AUTH}[radio_titulo_mr] 
    #First name *
    Input Text                       ${AUTH}[input_nome]             ${USUARIO}[nome]
    #Last name *
    Input Text                       ${AUTH}[input_sobrenome]        ${USUARIO}[sobrenome]
    #Password *
    Input Password                   ${AUTH}[input_senha]            ${USUARIO}[senha]
    #Date of Birth
    Select From List By Value        ${AUTH}[combo_dia_nascimento]   ${USUARIO}[dia_nascimento]
    Select From List By Value        ${AUTH}[combo_mes_nascimento]   ${USUARIO}[mes_nascimento]
    Select From List By Value        ${AUTH}[combo_ano_nascimento]   ${USUARIO}[ano_nascimeno]
    #Sign up for our newsletter!
    Select Checkbox                  ${AUTH}[checkbox_newsletter]
    #Receive special offers from our partners!
    #First name *
    #Last name *
    #Company
    Input Text                       ${AUTH}[input_empresa]          ${USUARIO}[empresa]
    #Address *
    Input Text                       ${AUTH}[input_endereco_1]       ${USUARIO}[endereco_1]
    #Address (Line 2)
    Input Text                       ${AUTH}[input_endereco_2]       ${USUARIO}[endereco_2]
    #City *
    Input Text                       ${AUTH}[input_cidade]           ${USUARIO}[cidade]
    #State *
    Select From List By Label        ${AUTH}[combo_estado]           ${USUARIO}[estado]
    #Zip/Postal Code *
    Input Text                       ${AUTH}[input_cep]              ${USUARIO}[cep]
    #Country *
    #Additional information
    #Home phone
    Input Text                       ${AUTH}[input_telefone]         ${USUARIO}[telefone]
    #Mobile phone *
    Input Text                       ${AUTH}[input_celular]          ${USUARIO}[celular]
    #Assign an address alias for future reference. *

Submeter cadastro
    Click Element                    ${AUTH}[botao_registrar]

Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    ${HEADER}[menu_signout]         timeout=${TIMEOUT}
    Page Should Contain              ${USUARIO}[nome]

Gerar Identificador Único
    ${uuid}=                         Evaluate    uuid.uuid4()        modules=uuid
    [Return]                         ${uuid}