*** Settings ***
Library    SeleniumLibrary
 
*** Variables ***
${USUARIO}       SGHX
${SENHA}         1234
         
 
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
    Execute JavaScript    tab.addTab("1239", "Pesquisar Pacientes", "/aghu/pages/paciente/pesquisaPaciente.xhtml", "silk-mouse", "1")
    Execute JavaScript    selecionarIdFavorito("1239")
    Execute JavaScript    selecionarMenuId("1239")
    Sleep    3s
 
    # E aguardo o iframe do módulo carregar
    Wait Until Element Is Visible    id=i_frame_pesquisar_pacientes    15
    Select Frame                     id=i_frame_pesquisar_pacientes
 
    # Quando faco input do nome e data de nascimento
    Input Text      id:nome:nome:inputId    MARIA    
    Sleep           4s
    Input Text      id:data_nasc:data_nasc:inputId_input   01/01/1990    
    Sleep           4s
    
    # pesquisa fonetica
    Click Element   id:btnPesquisaFonetica:button
    Sleep           4s
 
    # pesquisa siga
    Click Element   id:bt_paciente_siga:button
    Sleep           4s
 
    # pesquisa siga
    Click Element   id:bt_pesquisar_paciente_siga:button
    Sleep           4s
 
    # sempre selecionar o primeiro resultado
    Wait Until Element Is Visible    id=tabelaPacientes:resultList:0:j_idt167:link    15
    Click Element   id:tabelaPacientes:resultList:0:j_idt167:link
    Sleep           4s
 
    # Nacionalidade
    ${pais:pais:suggestion_input}=    Get Value    id:pais:pais:suggestion_input
    Run Keyword If    '${pais:pais:suggestion_input}' == ''    Input Text    id:pais:pais:suggestion_input    BRASILEIRO
    Sleep           5s
    Press Keys            id:pais:pais:suggestion_input    ENTER
 
    # Naturalidade
    ${naturalidade:naturalidade:suggestion_input}=    Get Value    id:naturalidade:naturalidade:suggestion_input
    Run Keyword If    '${naturalidade:naturalidade:suggestion_input}' == ''    Input Text    id:naturalidade:naturalidade:suggestion_input    SAO PAULO
    Sleep           5s
    Press Keys            id:naturalidade:naturalidade:suggestion_input    ENTER
 
    # Estabelecimento de Referência
    ${estabeleciementoReferencia:estabeleciementoReferencia:suggestion_input}=    Get Value    id:estabeleciementoReferencia:estabeleciementoReferencia:suggestion_input
    Run Keyword If    '${estabeleciementoReferencia:estabeleciementoReferencia:suggestion_input}' == ''    Input Text    id:estabeleciementoReferencia:estabeleciementoReferencia:suggestion_input    AMA/UBS INTEGRADA AGUA RASA
    Sleep           5s
    Press Keys            id:estabeleciementoReferencia:estabeleciementoReferencia:suggestion_input    ENTER
 
    Sleep           4s
 
    # ddd
    ${ddd_fone_contatos:ddd_fone_contatos:inputId_input}=    Get Value    id:ddd_fone_contatos:ddd_fone_contatos:inputId_input
    Run Keyword If    '${ddd_fone_contatos:ddd_fone_contatos:inputId_input}' == ''    Input Text    id:ddd_fone_contatos:ddd_fone_contatos:inputId_input    11
    Sleep           4s
 
    # telefone
    ${fone_contatos:fone_contatos:inputId_input}=    Get Value    id:fone_contatos:fone_contatos:inputId_input
    Run Keyword If    '${fone_contatos:fone_contatos:inputId_input}' == ''    Input Text    id:fone_contatos:fone_contatos:inputId_input    912345678
    Sleep           4s
    
    # telefone
 
    Click Element    id:tipoContatos:tipoContatos:inputId
    Sleep           4s
    Click Element    id:tipoContatos:tipoContatos:inputId_1    
    Sleep           4s
    
    # adicionar contato
    Click Element   id:j_idt968:button
    Sleep           4s
 
    # endereco
    ${cep:cep:inputId_input}=    Get Value    id:cep:cep:suggestion_input
    Run Keyword If    '${cep:cep:inputId_input}' == ''    Input Text    id:cep:cep:suggestion_input    01129010
    Sleep           5s
    Press Keys            id:cep:cep:suggestion_input    ENTER
    Sleep           5s
 
    # numero endereco
    ${numeroCadastrado:numeroCadastrado:inputId_input}=    Get Value    id:numeroCadastrado:numeroCadastrado:inputId_input
    Run Keyword If    '${numeroCadastrado:numeroCadastrado:inputId_input}' == ''    Input Text    id:numeroCadastrado:numeroCadastrado:inputId_input      100    
    Sleep           5s
    
    # Documentos Apresentados
    Click Element      id:bt_incluirCadastrado:button
    Sleep           5s
 
    Click Element     id:documentos_apresentados:documentos_apresentados:inputId:0
    Sleep           5s
 
    Click Element     id:panelBotoesAcaoFinal
    Sleep             5s

    # processo não finalizado 100% faltando salvar o formulario para retornar o registro interno