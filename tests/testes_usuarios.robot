*** Settings ***
Documentation    testes de login e cadastro de usuário e diretoria
Resource          ../resources/main.robot

*** Test Cases ***
cadastrar_usuario_com_sucesso
    [Tags]    T1    
    abrir avegador
    ${variavel_temporaria_nome}=     gerar_nome_aleatorio
    ${variavel_temporaria_email}=    gerar_email_aleatorio
    ${variavel_temporaria_cpf}=    gerar_cpf_aleatorio
    ${variavel_temporaria_password}=    gerar_password_aleatorio

    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro
    clicar em botao usuario
    clicar em botao criar novo usuario
    preencher nome novo usuario    ${variavel_temporaria_nome}
    preencher email novo usuario    ${variavel_temporaria_email}
    preencher acesso do usuario
    preencher cpf novo usuario    ${variavel_temporaria_cpf}            
    preencher senha novo usuario    ${variavel_temporaria_password}
    preencher cofirmar senha novo usuario    ${variavel_temporaria_password}
    clicar botao salvar
    validar cadastro de usuario com sucesso 
    clicar botao logout
    login valido keyword    ${variavel_temporaria_email}    ${variavel_temporaria_password}
    tirar print    logs/prints_usuario    preencheu_login_novo_usuario
    # elemento visivel    ${CAMPO_CADASTROS}
    fechar navegador


#lembrar de procurar uma melhor forma de verificar as mensagens de alerta
campos_nome_vazio_de _cadastrar_usuario   
    [Tags]    T2    
    abrir avegador
    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro
    clicar em botao usuario  
    clicar em botao criar novo usuario 
    clicar botao salvar
    elemento contem texto    //p[@class="css-bbipig" and contains(text(),'O campo nome completo é obrigatório')]    O campo nome completo é obrigatório
    tirar print    logs/prints_usuario    campos_vazios_cadastro_usuario_nome
    fechar navegador

campos_email_vazio_de _cadastrar_usuario 
    [Tags]    T3    
    abrir avegador
    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro
    clicar em botao usuario  
    clicar em botao criar novo usuario 
    clicar botao salvar
    elemento contem texto    //p[@class="css-bbipig" and contains(text(),'O campo email é obrigatório')]    O campo email é obrigatório
    tirar print    logs/prints_usuario    campos_vazios_cadastro_usuario_email
    fechar navegador

campo_perfil_vazio_de_cadastrar_usuario
    [Tags]    T4    
    abrir avegador
    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro
    clicar em botao usuario  
    clicar em botao criar novo usuario 
    clicar botao salvar
    elemento contem texto    //p[@class="css-bbipig" and contains(text(),'O campo perfil de acesso é obrigatório')]    O campo perfil de acesso é obrigatório
    tirar print    logs/prints_usuario    campos_vazios_cadastro_usuario_perfil
    fechar navegador

campo_cpf_vazio_de_cadastrar_usuario
    [Tags]    T5    
    abrir avegador
    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro
    clicar em botao usuario  
    clicar em botao criar novo usuario 
    clicar botao salvar
    elemento visivel     //p[@class="css-bbipig" and contains(text(),'O campo CPF é obrigatório')]
    elemento contem texto    //p[@class="css-bbipig" and contains(text(),'O campo CPF é obrigatório')]    O campo CPF é obrigatório   
    tirar print    logs/prints_usuario    campos_vazios_cadastro_usuario_cpf
    fechar navegador

#Falta as mensagens de alerta