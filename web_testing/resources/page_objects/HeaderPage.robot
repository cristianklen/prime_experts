*** Settings ***
Documentation            Recurso de definição das Keywords que utilizam os elementos da Page HEADER (Parte superior das Páginas)
Library                  SeleniumLibrary
Resource                 ../Commom.robot
Variables                ../locators/header_locators.py

*** Keywords ***
Acessar a página home do site Automation Practice
    Go To                             ${URL}
    Wait Until Element Is Visible     ${HEADER}[logo]                timeout=${TIMEOUT}

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                        ${HEADER}[campo_pesquisa]      ${PRODUTO}

Clicar no botão pesquisar
    Click Button                      ${HEADER}[botao_pesquisar]

Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Mouse Over                        ${HEADER}[menu_women]  

Clicar na sub categoria "Summer Dresses"
    Click Element                    ${HEADER}[item_do_menu_sumer_dresses]

Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
    Wait Until Element Is Visible    ${}[banner_nome_categoria]    timeout=${TIMEOUT}    