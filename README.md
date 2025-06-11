# Robot Web Tests

Este projeto contém uma coleção de testes automatizados para aplicações web utilizando o Robot Framework com o Google Chrome.

## Estrutura do Projeto

O projeto é organizado da seguinte forma:

```
robot-web-tests
├── tests
│   ├── 1-alterar_parametro_para_s.robot    # Teste alterar valor para S
│   ├── 2-alterar_parametro_para_n.robot    # Teste alterar valor para N
│   └── paciente
│       └── paciente.siga.robot             # Teste de cadastro e edição de paciente via SIGA
├── resources
│   └── keywords.robot                      # Palavras-chave reutilizáveis
├── variables
│   └── variables.robot                     # Variáveis globais do projeto
├── libs
│   └── custom_library.py                   # Biblioteca personalizada em Python
├── requirements.txt                        # Dependências do projeto
└── README.md                               # Documentação do projeto
```
 

### Recursos necessários
- Instalação do Python 3.8 ou superior
   - Verificar versão do python instalado: python --version
- Instalar o Robot Framework:
   - pip install robotframework
- Bibliotecas adicionais:
   - pip install robotframework-seleniumlibrary
   - pip install selenium

- Procure utilizar o VS Code
- Instale a extensão **Markdown Preview Mermaid Support** para visualizar recursos mermaid no README
--- 

### Objetivo

- Acessar [Sistema treinamento libertyti](https://treinamento.libertyti.com.br/aghu/pages/casca/casca.xhtml)
- Realizar login com usuário **SGHX**, e utilizar qualquer valor para o campo de senha
- Acessar Outros Módulos > Configuração > Sistema > Parâmetros de Sistema
- Em Parâmetros de Sistema pesquisar por **Nome do Parâmetro**: P_SGH_TOTEN_IMPRESSAO
- Editar o campo **Valor Texto** para *S* e depois *N*
- Realizar cadastro e edição de paciente via SIGA (ver pasta `paciente`)

---

### Fluxograma - Teste de integração

- Fluxo para alterar parametro para S
- Fluxo para alterar parametro para N

```mermaid

flowchart LR
    script-integracao((script-teste-integracao)) libertyti-homologacao@--> libertyti-homologacao(libertyti-homologacao)
    libertyti-homologacao@{ animate: true }

    libertyti-homologacao login@--> login{login}
    login@{ animate: true }

    login parametros-do-sistema@-->|sim| parametros-do-sistema[parametros-de-sistema]
    parametros-do-sistema@{ animate: true }

    login --x|nao| erro[erro]

    parametros-do-sistema valor-texto@--> |alterar| valor-texto
    valor-texto@{ animate: true }

    valor-texto alterado@--> alterado{alterado}
    alterado@{ animate: true }

    alterado sucesso@-->|sim| sucesso:::verde
    sucesso@{ animate: true }
    classDef verde stroke:#0f0

    alterado --x|nao| erro:::vermelho
    classDef vermelho stroke:#f00

   Novo fluxo para paciente.siga.robot
    login paciente-siga@-->|sim| paciente-siga[paciente.siga]
    paciente-siga@{ animate: true }
    paciente-siga cadastro@--> cadastro{cadastro}
    cadastro@{ animate: true }
    cadastro sucesso@-->|sim| sucesso
    cadastro --x|nao| erro
```

--- 

### Referências

- [Mermaid Flowchart](https://mermaid.js.org/syntax/flowchart.html)
- [Robot Framework](https://robotframework.org/)
- [Robot - Selenium Library](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)