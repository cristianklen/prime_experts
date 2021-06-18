*** Settings ***
Documentation        Definição dos recursos de uso comum
Library              SeleniumLibrary

*** Variables ***
${TIMEOUT}           10
${URL}               http://automationpractice.com

*** Keywords ***
## ---- SETUP
Abrir o Navegador
    Open Browser     browser=chrome

Fechar o Navegador
## ---- TEARDOWN
    Close Browser