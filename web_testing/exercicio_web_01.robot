*** Settings ***
Documentation        Caso de Teste 01:  Pesquisar produto existente
...                                     Acessar a página home do site Automation Practice
...                                     Digitar o nome do produto "Blouse" no campo de pesquisa
...                                     Clicar no botão pesquisar
...                                     Conferir se o produto "Blouse" foi listado no site
...                                     Site: http://automationpractice.com    
    


    
*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site
    

*** Keywords ***
Acessar a página home do site Automation Practice

Digitar o nome do produto "Blouse" no campo de pesquisa

Clicar no botão pesquisar

Conferir se o produto "Blouse" foi listado no site
  
  


  

