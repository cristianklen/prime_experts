
*** Settings ***
Documentation                         Resource com as implemenntações das Keywords da Suíte de Teste suiteWebTesting.robot
Library                               SeleniumLibrary

*** Variables ***
${URL}                                http://automationpractice.com
${TIMEOUT}                            10

*** Keywords ***
## ---- SETUP
Abrir o Navegador
    Open Browser                      browser=chrome

Fechar o Navegador
## ---- TEARDOWN
    Close Browser

Acessar a página home do site Automation Practice
    Go To                             ${URL}
    Wait Until Element Is Visible     xpath=//img[contains(@class,'logo img-responsive')]    timeout=${TIMEOUT}

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                        id=search_query_top    ${PRODUTO}

Clicar no botão pesquisar
    Click Button                      name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible     xpath=(//a[@class='product-name'][contains(.,'${PRODUTO}')])[2]    timeout=${TIMEOUT}

Adicionar o produro "${PRODUTO}" no carrinho
    Mouse Over                        xpath=(//a[@class='product-name'][contains(.,'${PRODUTO}')])[2]
    Click Element                     xpath=//span[contains(.,'Add to cart')]
    Wait Until Element Is Visible     xpath=//span[contains(.,'Proceed to checkout')]    timeout=${TIMEOUT}
    Click Element                     xpath=//span[contains(.,'Proceed to checkout')]

Conferir se o produto "${PRODUTO}" foi adicionado ao carrinho
    Element Should Contain            css=td.cart_description p.product-name a    ${PRODUTO}

Conferir mensagem "${MENSAGEM}"
    Wait Until Element Is Visible     css=p.alert    timeout=${TIMEOUT}
    Element Should Contain            css=p.alert    ${MENSAGEM}

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Mouse Over                       css=a.sf-with-ul[title="${CATEGORIA}"]

Clicar na sub categoria "${SUB_CATEGORIA}"
    Click Element                    css= a[title="${SUB_CATEGORIA}"]

Conferir se os produtos da sub-categoria "${SUB_CATEGORIA}" foram mostrados na página
    Wait Until Element Is Visible    css=a[title="Add to cart"]:first-child    timeout=${TIMEOUT}

Clicar em "Sign in"
    Click Link                       css=a.login
    Wait Until Element Is Visible    css=button[id=SubmitCreate]    timeout=${TIMEOUT}

Informar um e-mail válido
    ${id}                            Gerar Identificador Único
    Input Text                       css=input[data-validate="isEmail"]    fulano.tal_${id}@gmail.com

Clicar em "Create an account"
    Click Element                    css=button[id=SubmitCreate]
    Wait Until Page Contains         Your personal information    timeout=${TIMEOUT}

Preencher os dados obrigatórios
    #Title
    Click Element                    css=#id_gender1
    #First name *
    Input Text                       xpath=//input[@id='customer_firstname' or @name='customer_firstname']        Fulano
    #Last name *
    Input Text                       xpath=//input[@id='customer_lastname' or @name='customer_lastname']          de Tal
    #Password *
    Input Password                   xpath=//input[@id='passwd' or @name='passwd']                                Teste@123
    #Date of Birth
    Select From List By Value        xpath=//select[@id='days' or @name='days']                                   24
    Select From List By Value        xpath=//select[@id='months' or @name='months']                               10
    Select From List By Value        xpath=//select[@id='years' or @name='years']                                 1975
    #Sign up for our newsletter!
    Select Checkbox                  xpath=//input[@id='newsletter' or @name='newsletter']
    #Receive special offers from our partners!
    #First name *
    Input Text                       xpath=//input[@id='firstname' or @name='firstname']                          Fulano
    #Last name *
    Input Text                       xpath=//input[@id='lastname' or @name='lastname']                            de Tal
    #Company
    Input Text                       xpath=//input[@id='company' or @name='company']                              Microsoft Redmond Woods Campus
    #Address *
    Input Text                       xpath=//input[@id='address1' or @name='address1']                            5000 148th Ave NE
    #Address (Line 2)
    Input Text                       xpath=//input[@id='address2' or @name='address2']                            Redmond Woods
    #City *
    Input Text                       xpath=//input[@id='city' or @name='city']                                    Redmond
    #State *
    Select From List By Label        xpath=//select[@id='id_state' or @name='id_state']                           Washington
    #Zip/Postal Code *
    Input Text                       xpath=//input[@id='postcode' or @name='postcode']                            98052
    #Country *
    #Additional information
    #Home phone
    Input Text                       xpath=//input[@id='phone' or @name='phone']                                  +1 425-706-0031
    #Mobile phone *
    Input Text                       xpath=//input[@id='phone_mobile' or @name='phone_mobile']                    +1 425-985-8080
    #Assign an address alias for future reference. *

Submeter cadastro
    Click Element                    css = button[id=submitAccount]

Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    css=a.logout    timeout=${TIMEOUT}
    Page Should Contain              Sign out

Gerar Identificador Único
    ${uuid}=                         Evaluate    uuid.uuid4()    modules=uuid
    [Return]                         ${uuid}