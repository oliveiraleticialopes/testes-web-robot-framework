***settings***
*** Settings ***
Documentation    keywords de Diretoria

Resource    ../main.robot

*** Keywords ***
clicar botao diretoria
    clicar elemento    ${CAMPO_DIRETORIAS}

clicar botao cadastrar diretoria
    clicar elemento    ${BOTAO_CADASTRAR_DIRETORIA}

preencher nome diretoria
    [Arguments]    ${NOME_DIRETORIA}
    limpar_campo    ${CAMPO_NOME_NOVA_DIRETORIA} 
    preencher texto        ${CAMPO_NOME_NOVA_DIRETORIA}    ${NOME_DIRETORIA}  

alerta de campo diretoria invalida
    elemento nao visivel    ${ALERTA_DE_CAMPOS_INCORRETOS_DIRETORIA}

clicar na seta que direciona para a ultima diretoria 
    rolar ate ficar visivel    ${SETA_ULTIMA_DIRETORIA}
    clicar elemento    ${SETA_ULTIMA_DIRETORIA}

ir para a ultima diretoira cadastrarda
    [Arguments]    ${CODIGO_ULTIMA_DIRETORIA}    
    rolar ate ficar visivel    //ul[@class="css-18psgb0"]/li[div/p[text()="${CODIGO_ULTIMA_DIRETORIA}"]]/div/button[@id="edit"]
    clicar elemento    //ul[@class="css-18psgb0"]/li[div/p[text()="${CODIGO_ULTIMA_DIRETORIA}"]]/div/button[@id="edit"]  

encontrar a ultima diretoria com o novo nome
    [Arguments]    ${CODIGO_ULTIMA_DIRETORIA}    ${NOME_DIRETORIA}
    rolar ate ficar visivel    //p[text()="${CODIGO_ULTIMA_DIRETORIA}"]/ancestor::li//p[contains(text(), "${NOME_DIRETORIA}")]          
    elemento visivel    //p[text()="${CODIGO_ULTIMA_DIRETORIA}"]/ancestor::li//p[contains(text(), "${NOME_DIRETORIA}")]  