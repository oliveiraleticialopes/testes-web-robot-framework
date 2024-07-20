*** Settings ***

Documentation    Estrutura do projeto em pastas

Library    SeleniumLibrary
Library    String
Library    ./utils/scroll.py
Library    FakerLibrary
#variaveis globais

Resource   data/variaveis_globais.robot

#variaveis pages

Resource   pages/login_pages.robot
Resource   pages/home_pages.robot
Resource   pages/usuario_pages.robot
Resource   pages/diretoria_pages.robot

#keywords
Resource    ./utils/keywords_gerais.robot
Resource    ./utils/keywords_utils.robot
Resource    ./keywords/login_keywords.robot
Resource    ./keywords/usuarios_keywords.robot
Resource    ./keywords/diretoria_keywords.robot
