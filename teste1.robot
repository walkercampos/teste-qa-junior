*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USUARIO}       SGHX
${SENHA}         1234
${PESQUISA}      P_SGH_TOTEN_IMPRESSAO
${VALOR}         N

*** Test Cases ***
Cenário: Alterar parâmetro de sistema para S

    # Dado que estou na tela de login
    Open Browser    https://treinamento.libertyti.com.br/aghu/login.xhtml    chrome
    Maximize Browser Window

    # E faço login com usuário e senha válidos
    Input Text      id:usuario:usuario:inputId    ${USUARIO}
    Input Password  id:password:inputId           ${SENHA}
    Click Element   id:entrar

    # E acesso diretamente o módulo Parâmetros de Sistema
    Wait Until Page Contains Element    id=nav-scroll    10
    Execute JavaScript    tab.addTab("2000", "Parâmetros de Sistema", "/aghu/pages/parametrosistema/parametroList.xhtml", "silk-mouse", "1")
    Execute JavaScript    selecionarIdFavorito("2000")
    Execute JavaScript    selecionarMenuId("2000")
    Sleep    3s

    # E aguardo o iframe do módulo carregar
    Wait Until Element Is Visible    id=i_frame_parâmetros_de_sistema    15
    Select Frame                     id=i_frame_parâmetros_de_sistema

    # Quando pesquiso o parâmetro desejado
    Input Text      id:nome:nome:inputId    ${PESQUISA}
    Sleep           2s
    Click Element   id:bt_pesquisar:button
    Sleep           2s

    # E edito o primeiro resultado encontrado
    Click Element   id:tabelaResult:resultList:0:tabelaResult_link_editar:link
    Sleep           2s

    # E altero o VALOR do parâmetro
    Clear Element Text    id:vlrTexto:vlrTexto:inputId
    Input Text            id:vlrTexto:vlrTexto:inputId    ${VALOR}
    Sleep                 2s
    Click Element         id:bt_confirmar:button
    Sleep                 2s

    # Então vejo uma mensagem de confirmação da alteração
    Wait Until Element Is Visible    class:ui-messages-info-summary    10
    ${MENSAGEM_RETORNO}=    Get Text    class:ui-messages-info-summary
    Should Be Equal    ${MENSAGEM_RETORNO}    Parâmetro de Sistema P_SGH_TOTEN_IMPRESSAO alterado com sucesso!
    Log To Console    Mensagem encontrada: ${MENSAGEM_RETORNO}
