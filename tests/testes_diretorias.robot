*** Settings ***
Documentation    testes de login e cadastro de usuário e diretoria
Resource          ../resources/main.robot

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

#editar_diretoria
    # # Este teste foi um desafio, queria validar a edição/criação de uma diretoria, mas o campo pesquisa não funciona então tive
    # # que ir até o ultimo elemento da tabela e edita-lo, todas as novas diretorias criadas ficam na ultima posição da tabela assim 
    # # posso verificar se a diretoria foi criada e também se consigo edita-la, futuramente pretento integrar os dois testes para testar
    # # melhor o fluxo ainda não fiz isso nem ecapsulei pois pretendo melhorar os testes.
    # [Tags]    T3

    # ${NOME_DIRETORIA}=    gerar_nome_aleatorio_diretoria

    # login valido keyword    ${EMAIL}    ${PASSWORD} 
    # clicar menu de cadastro 
    # clicar botao diretoria
    # clicar na seta que direciona para a ultima diretoria
    # ${CODIGO_ULTIMA_DIRETORIA}=    Get Text    ${QUANTIDADE_DIRETORIAS}
    # rolar ate ficar visivel    //ul[@class="css-18psgb0"]/li[div/p[text()="${CODIGO_ULTIMA_DIRETORIA}"]]/div/button[@id="edit"]
    # tirar print    logs/prints_diretoria   RolouParaUltimaDiretoria
    # clicar elemento    //ul[@class="css-18psgb0"]/li[div/p[text()="${CODIGO_ULTIMA_DIRETORIA}"]]/div/button[@id="edit"]    
    # limpar_campo    ${CAMPO_NOME_NOVA_DIRETORIA}  
  
    # preencher texto    ${CAMPO_NOME_NOVA_DIRETORIA}    ${NOME_DIRETORIA}
    # clicar elemento    ${BOTAO_SALVAR} 
    # rolar ate ficar visivel    //p[text()="${CODIGO_ULTIMA_DIRETORIA}"]/ancestor::li//p[contains(text(), "${NOME_DIRETORIA}")]          
    # elemento visivel    //p[text()="${CODIGO_ULTIMA_DIRETORIA}"]/ancestor::li//p[contains(text(), "${NOME_DIRETORIA}")]    
    # tirar print     logs/prints_diretoria   editar_diretoria
    # fechar navegador