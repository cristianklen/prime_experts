
*** Settings ***
Documentation                         Resource com as implemenntações das Keywords da Suíte de Teste suiteWebTesting.robot
Library                               SeleniumLibrary

*** Variables ***
${URL}                                http://automationpractice.com

*** Keywords ***
## ---- SETUP
Abrir o Navegador
    Open Browser                      browser=chrome

Fechar o Navegador
## ---- TEARDOWN
    Close Browser

Acessar a página home do site Automation Practice
    Go To                             ${URL}
    Wait Until Element Is Visible     xpath=//img[contains(@class,'logo img-responsive')]

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                        id=search_query_top    ${PRODUTO}

Clicar no botão pesquisar
    Click Button                      name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible     xpath=(//a[@class='product-name'][contains(.,'${PRODUTO}')])[2]

Adicionar o produro "${PRODUTO}" no carrinho
    Mouse Over                        xpath=(//a[@class='product-name'][contains(.,'${PRODUTO}')])[2]
    Click Element                     xpath=//span[contains(.,'Add to cart')]
    Wait Until Element Is Visible     xpath=//span[contains(.,'Proceed to checkout')]
    Click Element                     xpath=//span[contains(.,'Proceed to checkout')]

Conferir se o produto "${PRODUTO}" foi adicionado ao carrinho
    Element Should Contain            css=td.cart_description p.product-name a    ${PRODUTO}

Conferir mensagem "${MENSAGEM}"
    Wait Until Element Is Visible     css=p.alert
    Element Should Contain            css=p.alert    ${MENSAGEM}

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Mouse Over                       css=a.sf-with-ul[title="${CATEGORIA}"]

Clicar na sub categoria "${SUB_CATEGORIA}"
    Click Element                    css= a[title="${SUB_CATEGORIA}"]

Conferir se os produtos da sub-categoria "${SUB_CATEGORIA}" foram mostrados na página
    Wait Until Element Is Visible    css=a[title="Add to cart"]:nth-child(1)

Clicar em "Sign in"
    Click Link                       css=a.login
    Wait Until Element Is Visible    css=button[id=SubmitCreate]

Informar um e-mail válido
    Input Text                       css=input[data-validate="isEmail"]    cristian.klen@gmail.com

Clicar em "Create an account"
    Click Element                    css=button[id=SubmitCreate]
    Wait Until Page Contains         Your personal information    timeout=10

Preencher os dados obrigatórios
    No Operation
    #Title
    #First name *
    #Last name *
    #Password *
    #Date of Birth
    #Sign up for our newsletter!
    #Receive special offers from our partners!
    #First name *
    #Last name *
    #Company
    #Address *
    #City *
    #State *
    #Zip/Postal Code *
    #Country *
    #Additional information
    #Home phone
    #Mobile phone *
    #Assign an address alias for future reference. *

Submeter cadastro
    Click Element                    css = button[id=submitAccount]

Conferir se o cadastro foi efetuado com sucesso
    No Operation

    