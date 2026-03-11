# Como o Robô do DuckHunt Funciona

O projeto é um jogo clássico do DuckHunt feito em JavaScript e HTML5, mas com um "jogador artificial" (um bot) que joga sozinho usando Inteligência Artificial!

Aqui está como a mágica acontece, de forma simples:

## 1. O "Olho" do Robô (A Captura de Imagem)
A cada 200 milissegundos (ou seja, 5 vezes por segundo), o jogo "tira uma foto" (captura a tela do jogo) do que está acontecendo na tela naquele instante e manda essa imagem para o cérebro do robô.

## 2. O "Cérebro" (A Inteligência Artificial)
O cérebro do robô é um modelo de Inteligência Artificial chamado **YOLOv5** (rodando no navegador usando a tecnologia TensorFlow.js). Ele é muito bom em olhar uma imagem e encontrar objetos dentro dela.

A IA recebe a imagem do jogo e a analisa. Curiosamente, ela não está treinada especificamente para procurar "patos de videogame". Porém, visualmente, os patos em formato de pixel-art lembram muito pipas (kites, em inglês). Então, a IA consegue identificar com sucesso os patos na tela relatando que encontrou uma "kite" (pipa).

## 3. O "Dedo no Gatilho" (O Tiro)
Quando a IA encontra uma pipa (o pato), ela devolve as coordenadas (um quadro imaginário) de onde o pato está na tela. O código do jogo pega essas coordenadas do quadro e as usa para:
1. Calcular o **ponto central** desse quadro.
2. Mover a mira para esse ponto central.
3. Simular um "clique" nesse exato ponto, atirando no pato.

E tudo isso acontece em uma fração de segundo, permitindo que o robô acerte os patos enquanto eles voam pela tela!
