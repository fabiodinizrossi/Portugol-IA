# Portugol-IA

Assistente de programação integrado ao Portugol Viana, com dicas geradas localmente pelo Ollama e pelo modelo Qwen2.5-Coder.

O assistente acompanha o código em construção e apresenta uma dica após uma pausa na digitação. Ele utiliza exemplos externos como referência de sintaxe e considera a posição do cursor para orientar correções e sugerir continuações.

> As dicas são geradas por IA e podem conter erros. Confira as sugestões com a documentação e o compilador do Portugol.

## Requisitos

- Windows, Linux ou macOS compatível com a versão instalada do Ollama.
- Ambiente gráfico para executar a interface Java Swing.
- Java JDK 11 ou superior. O JDK 21 pode ser utilizado.
- Ollama instalado e em execução.
- Modelo `qwen2.5-coder:3b` baixado.
- Arquivo original `Portugol.jar` e suas eventuais dependências.
- Internet para instalar as ferramentas e baixar o modelo.

Na configuração padrão, as consultas são processadas no próprio computador. Após a instalação e o download do modelo, não é necessário acesso à internet para gerar dicas.

## 1. Instalar o Ollama

### Windows

1. Acesse https://ollama.com/download/windows.
2. Baixe e execute o instalador.
3. Conclua a instalação e abra o Ollama.
4. Abra uma nova janela do PowerShell e verifique a instalação.

```powershell
ollama --version
```

### Linux

Execute o instalador oficial no Terminal.

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

Verifique a instalação.

```bash
ollama --version
```

Se o serviço não estiver ativo, execute o comando abaixo e mantenha esse Terminal aberto.

```bash
ollama serve
```

Utilize outro Terminal para os próximos comandos.

Documentação oficial: https://docs.ollama.com/linux.

### macOS

1. Acesse https://ollama.com/download/mac.
2. Instale o aplicativo em **Aplicativos**.
3. Abra o Ollama e conclua as orientações iniciais.
4. Abra o Terminal e verifique a instalação.

```bash
ollama --version
```

Documentação oficial: https://docs.ollama.com/macos.

## 2. Baixar o modelo

Com o Ollama ativo, execute o comando abaixo no Terminal ou PowerShell.

```bash
ollama pull qwen2.5-coder:3b
```

Confira os modelos instalados.

```bash
ollama list
```

Para testar o modelo diretamente, execute o seguinte comando.

```bash
ollama run qwen2.5-coder:3b
```

Digite uma pergunta e aguarde a resposta. Para encerrar a conversa, digite `/bye`.

Não é necessário manter essa conversa aberta para utilizar o assistente. Basta manter o serviço do Ollama ativo.

Página do modelo: https://ollama.com/library/qwen2.5-coder:3b.

## 3. Instalar o Java JDK

Baixe um JDK compatível com seu sistema operacional e arquitetura.

Uma opção é o Eclipse Temurin JDK 21:

https://adoptium.net/temurin/releases/

Instale o **JDK**, que inclui as ferramentas necessárias para executar e compilar o projeto.

Após a instalação, abra uma nova janela do Terminal ou PowerShell e verifique os comandos.

```bash
java -version
javac -version
jar --version
```

Se algum comando não for encontrado, confira a instalação e a configuração da variável `PATH`.

Em Macs com processadores Apple Silicon, selecione a arquitetura ARM64/aarch64.

## 4. Preparar o projeto

Baixe o repositório pelo botão **Code → Download ZIP** e extraia o conteúdo.

Também é possível cloná-lo com Git.

```bash
git clone URL_DO_REPOSITORIO
```

Substitua `URL_DO_REPOSITORIO` pelo endereço deste repositório.

Coloque o arquivo original `Portugol.jar` na pasta principal. Preserve a pasta `lib` ou outros arquivos auxiliares, caso sua distribuição do Portugol dependa deles.

### Arquivos do projeto

| Arquivo ou pasta | Função |
|---|---|
| `Portugol.jar` | IDE original do Portugol |
| `src/Assistente.java` | Código-fonte do assistente |
| `AssistentePortugol.jar` | Assistente compilado |
| `exemplos.md` | Referências de sintaxe lidas a cada consulta |
| `assistente.properties` | Configuração do modelo inicial |
| `manifest.mf` | Identificação da classe do agente Java |
| `classes/` | Classes geradas durante a compilação |
| `Iniciar.command` | Lançador para macOS, quando incluído no pacote |

O arquivo-fonte deve se chamar exatamente `Assistente.java`, dentro da pasta `src`.

Arquivos baixados com nomes como `Assistente(3).java` devem ser renomeados antes da compilação.

### Configurar o modelo

O arquivo `assistente.properties` deve conter:

```properties
modelo=qwen2.5-coder:3b
```

### Conferir o manifesto

O arquivo `manifest.mf` deve conter a linha abaixo e terminar com uma quebra de linha.

```text
Premain-Class: Assistente

```

## 5. Compilar

Execute os comandos na pasta principal do projeto.

Se o pacote já contém o `AssistentePortugol.jar` atualizado, esta etapa pode ser pulada.

### Windows com PowerShell

```powershell
New-Item -ItemType Directory -Force classes | Out-Null
javac --release 11 -encoding UTF-8 -d classes src/Assistente.java
```

Se a compilação terminar sem erros, gere o JAR.

```powershell
jar cfm AssistentePortugol.jar manifest.mf -C classes .
```

### Linux ou macOS

```bash
mkdir -p classes
javac --release 11 -encoding UTF-8 -d classes src/Assistente.java
```

Se a compilação terminar sem erros, gere o JAR.

```bash
jar cfm AssistentePortugol.jar manifest.mf -C classes .
```

> Se o `javac` apresentar erros, corrija-os antes de executar o comando `jar`. Caso contrário, o JAR pode continuar utilizando classes de uma compilação anterior.

A opção `--release 11` gera classes compatíveis com Java 11 ou superior.

Não é necessário copiar `exemplos.md` para a pasta `classes`. O assistente lê esse arquivo externamente.

## 6. Executar o Portugol com IA

Mantenha o Ollama ativo e execute o comando abaixo na pasta principal do projeto.

```bash
java -javaagent:AssistentePortugol.jar -jar Portugol.jar
```

Esse comando pode ser utilizado no Windows, Linux e macOS.

Abrir apenas `Portugol.jar` com dois cliques não carrega o assistente.

### Lançador para macOS

Se o arquivo `Iniciar.command` estiver incluído no pacote, conceda permissão de execução.

```bash
chmod +x Iniciar.command
```

Depois, execute:

```bash
./Iniciar.command
```

O lançador do macOS tenta iniciar o Ollama quando necessário, mas não baixa o modelo automaticamente.

## 7. Utilizar o assistente

1. Abra o editor de texto do Portugol.
2. Crie ou abra um algoritmo.
3. Comece a escrever.
4. Faça uma pausa de aproximadamente 2,5 segundos.
5. Aguarde a dica no painel flutuante.

A primeira resposta pode demorar mais porque o modelo precisa ser carregado na memória.

### Controles

| Controle | Função |
|---|---|
| **Pausar dicas** | Suspende as consultas automáticas |
| **Pedir dica agora** | Solicita uma análise manual, inclusive durante a pausa |
| **Acompanhar a janela da IDE** | Mantém o painel junto à janela do editor |
| Seletor de modelo | Permite informar outro modelo instalado no Ollama |

Mover o cursor sem alterar o código não dispara uma consulta automática nesta versão. Para analisar a nova posição, clique em **Pedir dica agora**.

As dicas não são inseridas automaticamente no editor. O estudante decide como utilizá-las.

## Como funciona

O assistente é carregado pela opção `-javaagent` na mesma máquina virtual Java que executa o Portugol.

Ele procura o componente de edição da IDE e acessa, por reflexão Java, o campo `TextPaneCode` da classe `Editor.GUI.EditorPTG`.

A cada consulta, o assistente:

1. Captura o código e a posição do cursor.
2. Lê o arquivo externo `exemplos.md` em UTF-8.
3. Monta as instruções de tutoria e o contexto da consulta.
4. Envia uma requisição HTTP à API local do Ollama.
5. Apresenta a resposta no painel.

O endereço padrão utilizado é:

```text
http://127.0.0.1:11434/api/chat
```

O Ollama recebe o texto enviado pelo assistente. Ele não abre nem interpreta diretamente o arquivo `Portugol.jar`.

O assistente não modifica o JAR original nem o código do estudante e não utiliza capturas de tela ou monitoramento global do teclado.

### Prioridade das dicas

O prompt orienta o modelo a:

1. Identificar um erro claro no código já escrito.
2. Na ausência de erro claro, sugerir a continuação da linha atual quando houver contexto suficiente.
3. Fazer uma pergunta breve quando a intenção for ambígua.

Esse comportamento é uma orientação ao modelo, não uma garantia de correção.

## Atualizar os exemplos

Edite `exemplos.md` na pasta principal e salve em UTF-8.

Não é necessário recompilar nem reiniciar o assistente. O arquivo é lido novamente antes de cada consulta.

Depois de salvar, clique em **Pedir dica agora**. Se uma consulta estiver em andamento, aguarde sua conclusão e solicite outra.

### Organização dos exemplos

- Utilize exemplos compatíveis com o dialeto da IDE.
- Identifique a estrutura demonstrada em cada seção.
- Evite regras contraditórias.
- Confira os exemplos na IDE antes de utilizá-los como referência.
- Evite conteúdo repetido ou desnecessário.

A versão atual envia o arquivo inteiro ao modelo. Ela não seleciona automaticamente os exemplos mais relevantes.

Os exemplos são contexto da consulta e não representam treinamento permanente do modelo.

## Atualizar o código ou o prompt

Alterações em `src/Assistente.java` exigem recompilação.

1. Feche o Portugol e o assistente.
2. Edite e salve `src/Assistente.java`.
3. Compile com `javac`.
4. Gere novamente `AssistentePortugol.jar`.
5. Reinicie o programa com `-javaagent`.

Editar o arquivo `.java` não atualiza o JAR automaticamente.

### Windows com PowerShell

```powershell
New-Item -ItemType Directory -Force classes | Out-Null
javac --release 11 -encoding UTF-8 -d classes src/Assistente.java
```

Após uma compilação sem erros:

```powershell
jar cfm AssistentePortugol.jar manifest.mf -C classes .
java -javaagent:AssistentePortugol.jar -jar Portugol.jar
```

### Linux ou macOS

```bash
mkdir -p classes
javac --release 11 -encoding UTF-8 -d classes src/Assistente.java
```

Após uma compilação sem erros:

```bash
jar cfm AssistentePortugol.jar manifest.mf -C classes .
java -javaagent:AssistentePortugol.jar -jar Portugol.jar
```

### Quando recompilar

| Alteração | Recompilar o assistente? | Reiniciar? |
|---|---|---|
| Conteúdo de `exemplos.md` | Não | Não |
| Prompt em `Assistente.java` | Sim | Sim |
| Código ou interface do assistente | Sim | Sim |
| Modelo em `assistente.properties` | Não | Sim |
| Modelo selecionado no painel | Não | Não |
| Algoritmo no editor | Não | Não |

## Configurações adicionais

As opções `-D` devem aparecer antes de `-jar`.

### Caminho dos exemplos

Para utilizar um arquivo em outro local:

```bash
java "-Dassistente.exemplos=/caminho/exemplos.md" -javaagent:AssistentePortugol.jar -jar Portugol.jar
```

No Windows, utilize o caminho correspondente, por exemplo:

```powershell
java "-Dassistente.exemplos=C:\Portugol_IA\exemplos.md" -javaagent:AssistentePortugol.jar -jar Portugol.jar
```

### Caminho da configuração

```bash
java "-Dassistente.config=/caminho/assistente.properties" -javaagent:AssistentePortugol.jar -jar Portugol.jar
```

### Endereço do Ollama

```bash
java "-Dassistente.url=http://127.0.0.1:11434" -javaagent:AssistentePortugol.jar -jar Portugol.jar
```

### Tamanho inicial do painel

Em `src/Assistente.java`, localize:

```java
panel.setSize(370,750);
```

O primeiro valor define a largura e o segundo, a altura. Alterações nessa instrução exigem recompilação.

Também é possível redimensionar a janela manualmente.

## Limites atuais

- A leitura do editor depende da estrutura interna da versão compatível do Portugol.
- O código enviado tem limite de 30.000 caracteres.
- Apenas uma consulta é executada por vez.
- A requisição possui tempo limite de 120 segundos.
- O modelo pode confundir dialetos, inventar erros ou sugerir continuações inadequadas.
- As dicas não utilizam os diagnósticos do compilador da IDE.
- O contexto está configurado com `num_ctx: 4096`.
- A geração está configurada com `num_predict: 400`.

A janela de contexto precisa acomodar as instruções, os exemplos, o código e a geração. Um arquivo de exemplos extenso pode ultrapassar o espaço disponível.

Aumentar `num_predict` amplia o limite de geração da resposta, mas não aumenta a janela de contexto.

Os parâmetros estão na montagem da requisição em `Assistente.java`. Alterá-los exige recompilação.

## Solução de problemas

| Problema | Verificação |
|---|---|
| `ollama` não encontrado | Confira a instalação e o `PATH`; reabra o Terminal |
| Falha de conexão | Abra o Ollama ou execute `ollama serve` |
| Porta 11434 já em uso | Pode já existir um serviço ativo; teste `ollama list` |
| Modelo não encontrado | Execute `ollama pull qwen2.5-coder:3b` |
| `javac` ou `jar` não encontrado | Confira a instalação do JDK e o `PATH` |
| Arquivo de exemplos não encontrado | Execute na pasta principal ou configure `assistente.exemplos` |
| Arquivo de exemplos vazio | Adicione conteúdo e salve em UTF-8 |
| Painel não aparece | Confira o uso da opção `-javaagent` |
| Editor não encontrado | Abra a janela de código e confira a compatibilidade da IDE |
| Alteração no Java não aparece | Recompile, gere o JAR e reinicie |
| Resposta demora | Aguarde o carregamento inicial e confira os recursos disponíveis |
| Resposta termina incompleta | Verifique `num_predict` |
| Dicas ignoram referências | Confira o conteúdo enviado e o tamanho do contexto |

## Documentação das ferramentas

- Ollama — https://ollama.com
- Ollama para Windows — https://docs.ollama.com/windows
- Ollama para Linux — https://docs.ollama.com/linux
- Ollama para macOS — https://docs.ollama.com/macos
- Qwen2.5-Coder 3B — https://ollama.com/library/qwen2.5-coder:3b
- Eclipse Temurin JDK — https://adoptium.net/temurin/releases/
