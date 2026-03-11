# Análise do Problema: Por que a IA está errando os tiros?

Após executar a aplicação no WSL e capturar os logs de predição do modelo (ex: `🎯 AI predicted at: (450.38, 124.36)`), notamos que a precisão dos tiros estava muito baixa, resultando constantemente na tela de **"You Lose!"** (Você Perdeu).

Analisando o código do "cérebro" da nossa IA no arquivo `machine-learning/worker.js`, o problema foi identificado.

## A Causa do Problema

O modelo YOLOv5 retorna as informações sobre onde o alvo ("kite"/pato) está no formato normalizado:
`[posição_X_do_centro, posição_Y_do_centro, largura, altura]`

No entanto, o código atual trata esse formato incorretamente, assumindo que as informações fossem:
`[X_inicial, Y_inicial, X_final, Y_final]`

Isso significa que o código original faz um **cálculo matemático incorreto** ao tentar descobrir o centro do pato:
```javascript
// O código pega o centro correto...
let [x1, y1, x2, y2] = boxes... 
x1 *= width; // x1 na verdade já é o centro X!
x2 *= width; // x2 na verdade é apenas a largura!

// ... E depois tenta adicionar a largura em cima do centro!
const boxWidth = x2 - x1; 
const centerX = x1 + boxWidth / 2;
```

Essa matemática defeituosa faz com que o robô atire torto: em vez de atirar no meio do pato, ele atira em um ponto deslocado para os lados e para baixo, fazendo o disparo errar quase sempre.

## A Solução
Como os valores `x1` e `y1` retornados pelo modelo já representam exatamente o **ponto central** do objeto (em formato de porcentagem/normalizado), a correção será simplificar a matemática: basta multiplicar esses valores pela largura e altura da tela, e ignorar todo o cálculo complexo das bordas.
