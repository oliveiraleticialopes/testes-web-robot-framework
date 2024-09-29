*** Settings ***
Documentation    testes de login e cadastro de usuário e diretoria
Resource          ../resources/main.robot
Test Setup    abrir avegador
Test Teardown    fechar navegador
*** Test Cases ***
cadastrar_diretoria
    [Tags]    T1

    ${NOME_DIRETORIA}=    gerar_nome_aleatorio_diretoria

    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro 
    clicar botao diretoria
    clicar botao cadastrar diretoria
    preencher nome diretoria    ${NOME_DIRETORIA}  
    clicar botao salvar
    tirar print    logs/prints_diretoria    preencheu_cadastro_diretoria
    alerta de campo diretoria invalida


campo_diretoria_sem_nome
    [Tags]    T2
    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro 
    clicar botao diretoria
    clicar botao cadastrar diretoria 
    clicar botao salvar
    elemento contem texto    ${ALERTA_CAMPO_DIRETORIA_EM_BRANCO}    O campo diretoria é obrigatório 
    tirar print    logs/prints_diretoria   diretoria_sem_nome



    