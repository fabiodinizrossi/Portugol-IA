# Exemplos para o Portugol IDE de Tomar

Dialeto de referência: Portugol IDE do Instituto Politécnico de Tomar, série 2.3, associado ao `Portugol.jar` do assistente. Cada seção de exemplo contém um programa independente e um caso para testar na IDE. Use os blocos de código como referência sintática. Se o assistente receber uma dúvida de sintaxe, recupere o exemplo pela estrutura usada e adapte somente o necessário ao enunciado.

## Referência rápida

| Recurso | Forma usada |
|---|---|
| Programa e comentários | `inicio` … `fim`, comentário de linha com `//` |
| Declarações | `inteiro`, `real`, `logico`, `caracter`, `texto` |
| Constante | `constante real pi <- 3.14159` |
| Atribuição e comparação | `valor <- 10` para atribuir, `valor = 10` para comparar |
| Entrada e saída | `ler valor` e `escrever "Valor = ", valor` |
| Operadores | `+`, `-`, `*`, `/`, `%`, `^`, `==`, ``=/=`, `<`, `<=`, `>`, `>=`, `e`, `ou` |
| Decisão | `se condição entao` … `senao` … `fimse`, com `senao` opcional |
| Seleção | `escolhe valor`, `caso valor:`, `defeito:`, `fimescolhe` |
| Repetição com contador | `para i de 0 ate 4 passo 1` … `proximo`, incluindo o limite quando alcançado |
| Teste antes do bloco | `enquanto condição faz` … `fimenquanto` |
| Teste depois do bloco | `repete` … `ate condição` termina quando a condição é verdadeira |
| Teste depois do bloco | `faz` … `enquanto condição` repete enquanto a condição é verdadeira |
| Vetores | `inteiro dados[5]`, índices de 0 a 4 |
| Matrizes | `inteiro dados[2][3]`, índices de 0 a 1 na linha e de 0 a 2 na coluna |
| Funções predefinidas | `RAIZ(expressao)` e `INT(expressao)` |

Para mostrar código no assistente, mantenha palavras-chave como `inicio`, `ler`, `escrever` e `fim`. O Portugol IDE 2.3 oferece funções predefinidas. Para problemas com funções próprias ou recursão, confirme a versão da IDE antes de propor uma sintaxe de declaração.

Os casos abaixo descrevem a saída esperada. Foi feita uma revisão estática. A execução na instalação local do assistente ainda precisa ser conferida.

## Primeiros programas

### 01. Olá, mundo

**Estruturas e termos de busca** — início, fim, comentário, saída.

**Caso de teste** — Sem entrada → Ola, mundo!

```portugol
inicio
    // Primeira mensagem
    escrever "Ola, mundo!"
fim
```

### 02. Leitura de texto e número

**Estruturas e termos de busca** — variável, texto, inteiro, ler, escrever.

**Caso de teste** — Ana, 16 → Ana tem 16 anos.

```portugol
inicio
    texto nome
    inteiro idade
    ler nome
    ler idade
    escrever nome, " tem ", idade, " anos."
fim
```

### 03. Área e perímetro

**Estruturas e termos de busca** — constante, real, potência, círculo.

**Caso de teste** — 2 → área e perímetro de aproximadamente 12,56637.

```portugol
inicio
    constante real pi <- 3.14159265
    real raio, area, perimetro
    ler raio
    area <- pi * (raio ^ 2)
    perimetro <- 2 * pi * raio
    escrever "Area = ", area, "\nPerimetro = ", perimetro
fim
```

### 04. Conversão de temperatura

**Estruturas e termos de busca** — real, expressão, Celsius, Fahrenheit.

**Caso de teste** — 25 → 77.

```portugol
inicio
    real celsius, fahrenheit
    ler celsius
    fahrenheit <- celsius * 9.0 / 5.0 + 32.0
    escrever fahrenheit
fim
```

### 05. Troca de valores

**Estruturas e termos de busca** — atribuição, variável auxiliar.

**Caso de teste** — 3, 8 → 8 e 3.

```portugol
inicio
    inteiro primeiro, segundo, auxiliar
    ler primeiro
    ler segundo
    auxiliar <- primeiro
    primeiro <- segundo
    segundo <- auxiliar
    escrever primeiro, " ", segundo
fim
```

## Decisões

### 06. Desconto com condição simples

**Estruturas e termos de busca** — se, então, desconto, porcentagem.

**Caso de teste** — 100 → 90. 70 → 70.

```portugol
inicio
    real total
    ler total
    se total >= 100.0 entao
        total <- total * 0.9
    fimse
    escrever total
fim
```

### 07. Par ou ímpar

**Estruturas e termos de busca** — se, senão, igualdade, resto.

**Caso de teste** — -3 → Impar. 0 → Par.

```portugol
inicio
    inteiro numero
    ler numero
    se numero % 2 = 0 entao
        escrever "Par"
    senao
        escrever "Impar"
    fimse
fim
```

### 08. Situação pela média

**Estruturas e termos de busca** — condição encadeada, classificação.

**Caso de teste** — 8, 6 → Aprovado. 5, 5 → Recuperacao. 3, 4 → Reprovado.

```portugol
inicio
    real primeira, segunda, media
    ler primeira
    ler segunda
    media <- (primeira + segunda) / 2.0
    se media >= 7.0 entao
        escrever "Aprovado"
    senao
        se media >= 5.0 entao
            escrever "Recuperacao"
        senao
            escrever "Reprovado"
        fimse
    fimse
fim
```

### 09. Ano bissexto

**Estruturas e termos de busca** — e, ou, múltiplos, condição composta.

**Caso de teste** — 1900 → Comum. 2000 → Bissexto. 2024 → Bissexto.

```portugol
inicio
    inteiro ano
    logico bissexto
    ler ano
    bissexto <- (ano % 400 = 0) ou ((ano % 4 = 0) e (ano % 100 > 0))
    se bissexto entao
        escrever "Bissexto"
    senao
        escrever "Comum"
    fimse
fim
```

### 10. Triângulo

**Estruturas e termos de busca** — condições compostas, validação, classificação.

**Caso de teste** — 3, 4, 5 → Escaleno. 2, 2, 3 → Isosceles. 1, 2, 3 → Invalido.

```portugol
inicio
    real a, b, c
    ler a
    ler b
    ler c
    se (a > 0) e (b > 0) e (c > 0) e (a + b > c) e (a + c > b) e (b + c > a) entao
        se (a = b) e (b = c) entao
            escrever "Equilatero"
        senao
            se (a = b) ou (a = c) ou (b = c) entao
                escrever "Isosceles"
            senao
                escrever "Escaleno"
            fimse
        fimse
    senao
        escrever "Invalido"
    fimse
fim
```

### 11. Calculadora

**Estruturas e termos de busca** — escolhe, caso, defeito, divisão por zero.

**Caso de teste** — /, 8, 2 → 4. /, 8, 0 → Divisao por zero.

```portugol
inicio
    caracter operacao
    real a, b
    ler operacao
    ler a
    ler b
    escolhe operacao
        caso "+":
            escrever a + b
        caso "-":
            escrever a - b
        caso "*":
            escrever a * b
        caso "/":
            se b = 0 entao
                escrever "Divisao por zero"
            senao
                escrever a / b
            fimse
        defeito:
            escrever "Operacao invalida"
    fimescolhe
fim
```

## Repetições e padrões

### 12. Tabuada

**Estruturas e termos de busca** — para, de, ate, passo, proximo.

**Caso de teste** — 7 → dez linhas, de 7 x 1 = 7 a 7 x 10 = 70.

```portugol
inicio
    inteiro numero, i
    ler numero
    para i de 1 ate 10 passo 1
        escrever numero, " x ", i, " = ", numero * i, "\n"
    proximo
fim
```

### 13. Contagem regressiva

**Estruturas e termos de busca** — passo negativo, limite inclusivo.

**Caso de teste** — Sem entrada → 5 4 3 2 1.

```portugol
inicio
    inteiro i
    para i de 5 ate 1 passo -1
        escrever i, " "
    proximo
fim
```

### 14. Fatorial

**Estruturas e termos de busca** — enquanto, acumulador, produto, validação.

**Caso de teste** — 0 → 1. 5 → 120. 13 → Informe um inteiro de 0 a 12.

```portugol
inicio
    inteiro numero, i, produto
    ler numero
    se (numero >= 0) e (numero <= 12) entao
        i <- 1
        produto <- 1
        enquanto i <= numero faz
            produto <- produto * i
            i <- i + 1
        fimenquanto
        escrever produto
    senao
        escrever "Informe um inteiro de 0 a 12"
    fimse
fim
```

### 15. Validação de nota

**Estruturas e termos de busca** — repete, ate, pós-teste, faixa válida.

**Caso de teste** — -1, 11, 8 → aceita 8.

```portugol
inicio
    real nota
    repete
        escrever "Informe uma nota de 0 a 10: "
        ler nota
    ate (nota >= 0.0) e (nota <= 10.0)
    escrever "Nota aceita: ", nota
fim
```

### 16. Validação de quantidade

**Estruturas e termos de busca** — faz, enquanto, pós-teste, condição de repetição.

**Caso de teste** — 0, -2, 3 → aceita 3.

```portugol
inicio
    inteiro quantidade
    faz
        escrever "Informe uma quantidade positiva: "
        ler quantidade
    enquanto quantidade <= 0
    escrever "Quantidade aceita: ", quantidade
fim
```

### 17. Média com sentinela

**Estruturas e termos de busca** — enquanto, contador, acumulador, entrada vazia.

**Caso de teste** — 4, 8, -1 → 6. -1 como primeira entrada → Nenhuma nota valida.

```portugol
inicio
    inteiro quantidade
    real nota, soma
    quantidade <- 0
    soma <- 0.0
    ler nota
    enquanto nota >= 0.0 faz
        se nota <= 10.0 entao
            soma <- soma + nota
            quantidade <- quantidade + 1
        fimse
        ler nota
    fimenquanto
    se quantidade > 0 entao
        escrever soma / quantidade
    senao
        escrever "Nenhuma nota valida"
    fimse
fim
```

### 18. Menor e maior de cinco valores

**Estruturas e termos de busca** — extremos, inicialização pelo primeiro valor.

**Caso de teste** — -8, -2, -9, -3, -6 → mínimo -9, máximo -2.

```portugol
inicio
    inteiro i, valor, menor, maior
    ler valor
    menor <- valor
    maior <- valor
    para i de 2 ate 5 passo 1
        ler valor
        se valor < menor entao
            menor <- valor
        fimse
        se valor > maior entao
            maior <- valor
        fimse
    proximo
    escrever "Menor = ", menor, "\nMaior = ", maior
fim
```

### 19. Teste de primalidade

**Estruturas e termos de busca** — laço, flag lógica, resto, divisor, parada antecipada.

**Caso de teste** — 29 → Primo. 49 e 1 → Nao primo.

```portugol
inicio
    inteiro numero, divisor
    logico primo
    ler numero
    primo <- numero > 1
    divisor <- 2
    enquanto primo e (1.0 * divisor * divisor <= numero) faz
        primo <- numero % divisor > 0
        divisor <- divisor + 1
    fimenquanto
    se primo entao
        escrever "Primo"
    senao
        escrever "Nao primo"
    fimse
fim
```

### 20. Máximo divisor comum

**Estruturas e termos de busca** — Euclides, enquanto, resto, troca de estado.

**Caso de teste** — Para entradas não negativas, 48, 18 → 6. 0, 7 → 7.

```portugol
inicio
    inteiro a, b, resto
    ler a
    ler b
    se (a < 0) ou (b < 0) ou ((a = 0) e (b = 0)) entao
        escrever "Entrada invalida"
    senao
        enquanto b > 0 faz
            resto <- a % b
            a <- b
            b <- resto
        fimenquanto
        escrever a
    fimse
fim
```

### 21. Fibonacci

**Estruturas e termos de busca** — sequência, estado, valores anteriores.

**Caso de teste** — Sem entrada → 0 1 1 2 3 5 8 13 21 34.

```portugol
inicio
    inteiro i, anterior, atual, seguinte
    anterior <- 0
    atual <- 1
    para i de 1 ate 10 passo 1
        escrever anterior, " "
        seguinte <- anterior + atual
        anterior <- atual
        atual <- seguinte
    proximo
fim
```

### 22. Retângulo de asteriscos

**Estruturas e termos de busca** — laços aninhados, linhas, colunas.

**Caso de teste** — Sem entrada → três linhas com quatro asteriscos cada.

```portugol
inicio
    inteiro linha, coluna
    para linha de 1 ate 3 passo 1
        para coluna de 1 ate 4 passo 1
            escrever "*"
        proximo
        escrever "\n"
    proximo
fim
```

## Vetores e matrizes

### 23. Soma e média de vetor

**Estruturas e termos de busca** — vetor, índice, leitura, soma.

**Caso de teste** — 2, 4, 6, 8, 10 → média 6.

```portugol
inicio
    real valores[5]
    real soma
    inteiro i
    soma <- 0.0
    para i de 0 ate 4 passo 1
        ler valores[i]
        soma <- soma + valores[i]
    proximo
    escrever soma / 5.0
fim
```

### 24. Busca linear

**Estruturas e termos de busca** — vetor, primeira ocorrência, posição ausente.

**Caso de teste** — 5, 9, 9, 3, 7 e busca 9 → índice 1. Busca 2 → -1.

```portugol
inicio
    inteiro valores[5]
    inteiro i, alvo, posicao
    para i de 0 ate 4 passo 1
        ler valores[i]
    proximo
    ler alvo
    posicao <- -1
    para i de 0 ate 4 passo 1
        se (posicao < 0) e (valores[i] = alvo) entao
            posicao <- i
        fimse
    proximo
    escrever posicao
fim
```

### 25. Inversão de vetor

**Estruturas e termos de busca** — dois índices, troca, espelhamento.

**Caso de teste** — 1, 2, 3, 4, 5 → 5 4 3 2 1.

```portugol
inicio
    inteiro valores[5]
    inteiro i, j, auxiliar
    para i de 0 ate 4 passo 1
        ler valores[i]
    proximo
    para i de 0 ate 1 passo 1
        j <- 4 - i
        auxiliar <- valores[i]
        valores[i] <- valores[j]
        valores[j] <- auxiliar
    proximo
    para i de 0 ate 4 passo 1
        escrever valores[i], " "
    proximo
fim
```

### 26. Ordenação por seleção

**Estruturas e termos de busca** — selection sort, mínimo, índice, troca.

**Caso de teste** — 8, -1, 4, 4, 0 → -1 0 4 4 8.

```portugol
inicio
    inteiro valores[5]
    inteiro i, j, menor, auxiliar, inicial
    para i de 0 ate 4 passo 1
        ler valores[i]
    proximo
    para i de 0 ate 3 passo 1
        menor <- i
        inicial <- i + 1
        para j de inicial ate 4 passo 1
            se valores[j] < valores[menor] entao
                menor <- j
            fimse
        proximo
        auxiliar <- valores[i]
        valores[i] <- valores[menor]
        valores[menor] <- auxiliar
    proximo
    para i de 0 ate 4 passo 1
        escrever valores[i], " "
    proximo
fim
```

### 27. Vetores paralelos

**Estruturas e termos de busca** — cadastro, nomes, notas, melhor resultado.

**Caso de teste** — Ana, 7, Bia, 9, Caio, 8 → Bia 9. Em empate, mantém o primeiro.

```portugol
inicio
    texto nomes[3]
    real notas[3]
    inteiro i, melhor
    melhor <- 0
    para i de 0 ate 2 passo 1
        ler nomes[i]
        ler notas[i]
        se notas[i] > notas[melhor] entao
            melhor <- i
        fimse
    proximo
    escrever nomes[melhor], " ", notas[melhor]
fim
```

### 28. Diagonais de matriz

**Estruturas e termos de busca** — matriz quadrada, dois índices, diagonal principal e secundária.

**Caso de teste** — 1 a 9, em ordem de linha → 15 e 15.

```portugol
inicio
    inteiro dados[3][3]
    inteiro i, j, principal, secundaria
    principal <- 0
    secundaria <- 0
    para i de 0 ate 2 passo 1
        para j de 0 ate 2 passo 1
            ler dados[i][j]
        proximo
    proximo
    para i de 0 ate 2 passo 1
        principal <- principal + dados[i][i]
        secundaria <- secundaria + dados[i][2 - i]
    proximo
    escrever principal, " ", secundaria
fim
```

### 29. Transposição de matriz

**Estruturas e termos de busca** — matriz retangular, linhas e colunas.

**Caso de teste** — 1, 2, 3, 4, 5, 6 → linhas 1 4, 2 5 e 3 6.

```portugol
inicio
    inteiro original[2][3]
    inteiro i, j
    para i de 0 ate 1 passo 1
        para j de 0 ate 2 passo 1
            ler original[i][j]
        proximo
    proximo
    para j de 0 ate 2 passo 1
        para i de 0 ate 1 passo 1
            escrever original[i][j], " "
        proximo
        escrever "\n"
    proximo
fim
```

## Problemas integradores

### 30. Menu de estoque

**Estruturas e termos de busca** — repete, escolhe, estado, validação, saldo.

**Caso de teste** — entrada 1, 5, 2, 2, 3, 0 → saldo 3. Opções 1 adicionar, 2 retirar, 3 consultar, 0 sair.

```portugol
inicio
    inteiro opcao, saldo, quantidade
    saldo <- 0
    repete
        escrever "\n1 Adicionar | 2 Retirar | 3 Consultar | 0 Sair\n"
        ler opcao
        escolhe opcao
            caso 1:
                ler quantidade
                se quantidade > 0 entao
                    saldo <- saldo + quantidade
                senao
                    escrever "Quantidade invalida"
                fimse
            caso 2:
                ler quantidade
                se (quantidade > 0) e (quantidade <= saldo) entao
                    saldo <- saldo - quantidade
                senao
                    escrever "Retirada invalida"
                fimse
            caso 3:
                escrever "Saldo: ", saldo
            caso 0:
                escrever "Fim"
            defeito:
                escrever "Opcao invalida"
        fimescolhe
    ate opcao = 0
fim
```

### 31. Histograma de notas inteiras

**Estruturas e termos de busca** — vetor de frequências, validação, índice calculado.

**Caso de teste** — 0, 10, 10, 5, 5 → frequência 1 para nota 0, 2 para 5 e 10, zero nas demais.

```portugol
inicio
    inteiro frequencias[11]
    inteiro i, nota
    para i de 0 ate 10 passo 1
        frequencias[i] <- 0
    proximo
    para i de 1 ate 5 passo 1
        repete
            ler nota
        ate (nota >= 0) e (nota <= 10)
        frequencias[nota] <- frequencias[nota] + 1
    proximo
    para i de 0 ate 10 passo 1
        escrever i, ": ", frequencias[i], "\n"
    proximo
fim
```

### 32. Distância entre dois pontos

**Estruturas e termos de busca** — função predefinida, RAIZ, coordenadas, hipotenusa.

**Caso de teste** — 0, 0, 3, 4 → 5.

```portugol
inicio
    real x1, y1, x2, y2, dx, dy, distancia
    ler x1
    ler y1
    ler x2
    ler y2
    dx <- x2 - x1
    dy <- y2 - y1
    distancia <- RAIZ(dx * dx + dy * dy)
    escrever distancia
fim
```

### 33. Total por produto

**Estruturas e termos de busca** — quantidade, preço, totalização, média ponderada.

**Caso de teste** — Produtos com quantidades 2, 1, 3 e preços 10, 20, 4 → total 52 e preço médio unitário de aproximadamente 8,67.

```portugol
inicio
    inteiro i, quantidade, unidades
    real preco, total
    unidades <- 0
    total <- 0.0
    para i de 1 ate 3 passo 1
        repete
            ler quantidade
        ate quantidade >= 0
        repete
            ler preco
        ate preco >= 0.0
        unidades <- unidades + quantidade
        total <- total + quantidade * preco
    proximo
    escrever "Total: ", total
    se unidades > 0 entao
        escrever "\nPreco medio: ", total / unidades
    fimse
fim
```

### 34. Busca binária em vetor ordenado

**Estruturas e termos de busca** — busca, intervalo, INT, posição ausente.

**Caso de teste** — 2, 4, 6, 8, 10 e busca 8 → 3. Busca 7 → -1. Forneça cinco valores em ordem crescente.

```portugol
inicio
    inteiro dados[5]
    inteiro i, alvo, esquerda, direita, meio, posicao
    para i de 0 ate 4 passo 1
        ler dados[i]
    proximo
    ler alvo
    esquerda <- 0
    direita <- 4
    posicao <- -1
    enquanto (esquerda <= direita) e (posicao < 0) faz
        meio <- INT((esquerda + direita) / 2.0)
        se dados[meio] = alvo entao
            posicao <- meio
        senao
            se dados[meio] < alvo entao
                esquerda <- meio + 1
            senao
                direita <- meio - 1
            fimse
        fimse
    fimenquanto
    escrever posicao
fim
```

### 35. Soma por linha

**Estruturas e termos de busca** — matriz, acumulador reinicializado, totalização.

**Caso de teste** — 1, 2, 3, 4, 5, 6 → somas 6 e 15.

```portugol
inicio
    inteiro matriz[2][3]
    inteiro i, j, soma
    para i de 0 ate 1 passo 1
        para j de 0 ate 2 passo 1
            ler matriz[i][j]
        proximo
    proximo
    para i de 0 ate 1 passo 1
        soma <- 0
        para j de 0 ate 2 passo 1
            soma <- soma + matriz[i][j]
        proximo
        escrever soma, "\n"
    proximo
fim
```

### 36. Contagem de vogais em cinco entradas

**Estruturas e termos de busca** — caracter, comparação, ou, contador.

**Caso de teste** — a, b, e, x, u → 3. Informe letras minúsculas, uma por leitura.

```portugol
inicio
    inteiro i, quantidade
    caracter letra
    quantidade <- 0
    para i de 1 ate 5 passo 1
        ler letra
        se (letra = "a") ou (letra = "e") ou (letra = "i") ou (letra = "o") ou (letra = "u") entao
            quantidade <- quantidade + 1
        fimse
    proximo
    escrever quantidade
fim
```

### 37. Soma dos algarismos

**Estruturas e termos de busca** — resto, divisão, truncamento, enquanto.

**Caso de teste** — 709 → 16. 0 → 0.

```portugol
inicio
    inteiro numero, soma
    ler numero
    se numero < 0 entao
        escrever "Use um inteiro nao negativo"
    senao
        soma <- 0
        enquanto numero > 0 faz
            soma <- soma + numero % 10
            numero <- INT(numero / 10.0)
        fimenquanto
        escrever soma
    fimse
fim
```

## Referências consultadas

- António Manso, Luís Oliveira e Carlos Marques. [Ambiente de Aprendizagem de Algoritmos – Portugol IDE](https://orion.ipt.pt/~manso/papers/2009/Portugol%20Challenges2009.pdf). Descreve a linguagem e suas estruturas.
- Unitins. [Apostila de Análise e Desenvolvimento de Sistemas, Lógica para Programação](https://pt.scribd.com/document/432529706/Apostila-1%C2%BA-Periodo-t2). Apresenta tipos, operadores e comandos com base na ajuda da versão 2.3.
- [Introdução ao Portugol IDE](https://www.scribd.com/doc/95735813/Portugol-Intro). Material com exemplos de vetores, matrizes, decisões, repetições e funções predefinidas.
- [Plano de curso de Introdução à Programação da UNIFAL-MG](https://bcc.unifal-mg.edu.br/~humberto/disciplinas/2008_1_introProg/planoDeCurso_introProg_2008_1.pdf). Identifica a versão 2.3 e a limitação quanto à declaração de funções.
