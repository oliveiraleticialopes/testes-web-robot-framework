*** Settings ***
Documentation    testes de login e cadastro de usuário e diretoria
Resource          ../resources/main.robot

*** Test Cases ***
#Lembrar de separar os testes em pastas 
login_valido
    [Tags]    T1 
    abrir avegador   
    preencher email    ${EMAIL}
    preencher senha    ${PASSWORD}
    tirar print    logs/prints_login   preecheu_login
    clicar botao entrar
    validar login de sucesso
    tirar print    logs/prints_login    fez_login
    fechar navegador
    
login_invalido
    [Tags]    T2 
    abrir avegador 
    preencher email    ${EMAIL_INVALIDO}
    preencher senha    ${PASSWORD_INVALIDO}
    clicar botao entrar
    mensagem de erro de login invalido  
    tirar print    logs/prints_login    preecheu_email_invalido-pagina              
    fechar navegador

campo_email_e_senha_vazio
    [Tags]    T3 
    abrir avegador
    limpar campo email    
    limpar campo senha
    clicar botao entrar
    alerta de campo email vazio
    alerta de campo senha vazio
    fechar navegador

campo_senha_vazio
    [Tags]    T4 
    abrir avegador
    preencher email    ${EMAIL}
    limpar campo senha
    clicar botao entrar
    alerta de campo senha vazio
    fechar navegador

campo_email_vazio
    [Tags]    T5 
    abrir avegador
    limpar campo email
    preencher senha    ${PASSWORD}
    clicar botao entrar
    alerta de campo email vazio
    fechar navegador        

fazer_logout
    [Tags]    T6  
    abrir avegador
    login valido
    tirar print    logs/prints_home    fez_login_para_logout
    clicar botao logout
    clicar botao entrar
    tirar print    logs/prints_home     fez_logout
    fechar navegador