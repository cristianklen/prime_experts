*** Settings ***
Documentation        Definição dos recursos de uso comum
Library              SeleniumLibrary

*** Variables ***
${TIMEOUT}           10
${URL}               http://automationpractice.com

*** Keywords ***
## ---- SETUP
Abrir o Navegador
    Open Browser     browser=chrome    options=add_argument("--start-maximized");add_argument("--incognito")

Fechar o Navegador
## ---- TEARDOWN
    Close Browser