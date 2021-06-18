*** Settings ***
Documentation       Suíte de Teste CRIAR - Site: http://automationpractice.com    
Resource            ../../resources/Commom.robot
Resource            ../../resources/page_objects/HeaderPage.robot
Resource            ../../resources/page_objects/AuthenticationPage.robot

Suite Setup         Abrir o Navegador      
Suite Teardown      Fechar o Navegador

*** Test Cases ***
Caso de Teste 04: Adicionar Cliente
    HeaderPage.Acessar a página home do site Automation Practice
    AuthenticationPage.Clicar em "Sign in"
    AuthenticationPage.Informar um e-mail válido
    AuthenticationPage.Clicar em "Create an account"
    AuthenticationPage.Preencher os dados obrigatórios
    AuthenticationPage.Submeter cadastro    
    AuthenticationPage.Conferir se o cadastro foi efetuado com sucesso