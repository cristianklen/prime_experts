*** Settings ***
Documentation       Suíte de Teste LISTAR - Site: http://automationpractice.com    
Resource            ../../resources/Commom.robot
Resource            ../../resources/page_objects/HeaderPage.robot
Resource            ../../resources/page_objects/ListingPage.robot

Suite Setup         Abrir o Navegador      
Suite Teardown      Fechar o Navegador
Library    Collections

*** Test Cases ***
Caso de Teste 03: Listar Produtos
    HeaderPage.Acessar a página home do site Automation Practice
    HeaderPage.Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    HeaderPage.Clicar na sub categoria "Summer Dresses"
    ListingPage.Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página