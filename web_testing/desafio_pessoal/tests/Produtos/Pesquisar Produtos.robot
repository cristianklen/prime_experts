*** Settings ***
Documentation       Suíte de Teste PESQUISAR - Site: http://automationpractice.com    
Resource            ../../resources/Commom.robot
Resource            ../../resources/page_objects/HeaderPage.robot
Resource            ../../resources/page_objects/SearchPage.robot

Suite Setup         Abrir o Navegador      
Suite Teardown      Fechar o Navegador


*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    HeaderPage.Acessar a página home do site Automation Practice
    HeaderPage.Digitar o nome do produto "Blouse" no campo de pesquisa
    HeaderPage.Clicar no botão pesquisar
    SearchPage.Conferir se o produto "Blouse" foi listado no site
    SearchPage.Adicionar o produro "Blouse" no carrinho
    SearchPage.Conferir se o produto "Blouse" foi adicionado ao carrinho    

Caso de Teste 02: Pesquisar produto não existente
    HeaderPage.Acessar a página home do site Automation Practice
    SearchPage.Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    HeaderPage.Clicar no botão pesquisar
    SearchPage.Conferir mensagem "No results were found for your search "itemNãoExistente""