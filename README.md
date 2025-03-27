# Teste Web Robot

Este projeto implementa testes automatizados utilizando o [Robot Framework](https://robotframework.org) e SeleniumLibrary para automação de testes em aplicações web.

## Estrutura do Projeto

- **.github/workflows/**  
  Contém o pipeline do GitHub Actions para execução dos testes. Veja [pipeline_desbravadores.yml](.github/workflows/pipeline_desbravadores.yml).

- **resources/**  
  - **data/**: Variáveis globais, implementadas em [variaveis_globais.robot](resources/data/variaveis_globais.robot).
  - **keywords/**: Palavras-chave específicas para as funcionalidades (login, diretoria, usuário).  
    - [diretoria_keywords.robot](resources/keywords/diretoria_keywords.robot)  
    - [login_keywords.robot](resources/keywords/login_keywords.robot)  
    - [usuarios_keywords.robot](resources/keywords/usuarios_keywords.robot)
  - **pages/**: Localização dos elementos das páginas web.  
    - [login_pages.robot](resources/pages/login_pages.robot)  
    - [home_pages.robot](resources/pages/home_pages.robot)  
    - [usuario_pages.robot](resources/pages/usuario_pages.robot)  
    - [diretoria_pages.robot](resources/pages/diretoria_pages.robot)
  - **utils/**: Utilitários de massa e de scroll.  
    - [keywords_gerais.robot](resources/utils/keywords_gerais.robot)  
    - [keywords_utils.robot](resources/utils/keywords_utils.robot)  
    - [scroll.py](resources/utils/scroll.py)
  - [main.robot](resources/main.robot): Arquivo central que organiza os recursos e keywords.

- **tests/**  
  Casos de teste implementados com Robot Framework:  
  - [testes_login.robot](tests/testes_login.robot)  
  - [testes_usuarios.robot](tests/testes_usuarios.robot)  
  - [testes_diretorias.robot](tests/testes_diretorias.robot)

- 

## Pré-requisitos

- [Python 3.10](https://www.python.org/downloads/release/python-310/)
- [Robot Framework](https://robotframework.org)
- [Robot Framework SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary)
- Navegador [Chrome](https://www.google.com/chrome/) (ou outro configurado nas variáveis)

