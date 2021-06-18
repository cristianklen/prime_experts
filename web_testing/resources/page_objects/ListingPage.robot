*** Settings ***
Documentation            Recurso de definição das Keywords que utilizam os elementos da Page LISTING
Library                  SeleniumLibrary
Resource                 ../Commom.robot
Variables                ../locators/listing_locators.py

*** Keywords ***
Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
    Wait Until Element Is Visible    ${LISTING}[banner_nome_categoria]    timeout=${TIMEOUT}    