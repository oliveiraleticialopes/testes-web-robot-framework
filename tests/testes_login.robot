*** Settings ***
Documentation    testes de login e cadastro de usuário e diretoria
Resource          ../resources/main.robot
Test Setup    abrir avegador
Test Teardown    fechar navegador    
*** Test Cases ***
#Lembrar de separar os testes em pastas 
login_valido
    [Tags]    T1    
    preencher email    ${EMAIL}
    preencher senha    ${PASSWORD}
    tirar print    logs/prints_login   preecheu_login
    clicar botao entrar
    validar login de sucesso
    tirar print    logs/prints_login    fez_login
    

login_invalido
    [Tags]    T2  
    preencher email    ${EMAIL_INVALIDO}
    preencher senha    ${PASSWORD_INVALIDO}
    clicar botao entrar
    mensagem de erro de login invalido  
    tirar print    logs/prints_login    preecheu_email_invalido-pagina              
    

campo_email_e_senha_vazio
    [Tags]    T3 
    limpar campo email    
    limpar campo senha
    clicar botao entrar
    alerta de campo email vazio
    alerta de campo senha vazio
    

campo_senha_vazio
    [Tags]    T4 
    preencher email    ${EMAIL}
    limpar campo senha
    clicar botao entrar
    alerta de campo senha vazio
    

campo_email_vazio
    [Tags]    T5 
    limpar campo email
    preencher senha    ${PASSWORD}
    clicar botao entrar
    alerta de campo email vazio
            

fazer_logout
    [Tags]    T6  
    login valido
    tirar print    logs/prints_home    fez_login_para_logout
    clicar botao logout
    botao entrar e visivel
    tirar print    logs/prints_home     fez_logout
    