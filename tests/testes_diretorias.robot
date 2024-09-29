*** Settings ***
Documentation    testes de login e cadastro de usuário e diretoria
Resource          ../resources/main.robot
Test Setup    abrir avegador
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
    fechar navegador

campo_diretoria_sem_nome
    [Tags]    T2
    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro 
    clicar botao diretoria
    clicar botao cadastrar diretoria 
    clicar botao salvar
    elemento contem texto    ${ALERTA_CAMPO_DIRETORIA_EM_BRANCO}    O campo diretoria é obrigatório 
    tirar print    logs/prints_diretoria   diretoria_sem_nome
    fechar navegador

editar diretoria ecapsualamento
    [Tags]    T11
    ${NOME_DIRETORIA}=    gerar_nome_aleatorio_diretoria
    login valido keyword    ${EMAIL}    ${PASSWORD} 
    clicar menu de cadastro 
    clicar botao diretoria
    clicar na seta que direciona para a ultima diretoria
    ${CODIGO_ULTIMA_DIRETORIA}=    Get Text    ${QUANTIDADE_DIRETORIAS}
    ir para a ultima diretoira cadastrarda    ${CODIGO_ULTIMA_DIRETORIA}
    tirar print    logs/prints_diretoria   RolouParaUltimaDiretoria
    preencher nome diretoria    ${NOME_DIRETORIA}
    clicar botao salvar 
    encontrar a ultima diretoria com o novo nome    ${CODIGO_ULTIMA_DIRETORIA}    ${NOME_DIRETORIA}   
    tirar print     logs/prints_diretoria   editar_diretoria
    fechar navegador
    