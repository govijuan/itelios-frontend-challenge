![Itelios](http://www.itelios.com.br/images/logo_itelios_orange@2x.png)

# Itelios Frontend Challenge

Bem-vindo ao desafio de admissão de front-end da Itelios! O que preparamos para este desafio é um pedacinho do que você irá fazer aqui na Itelios, caso seja admitido.

O objetivo do desafio é simples: Consumir uma json via xhttp e, com o resultado dele, montar um widget de prateleira de cross-sell. Na resposta deste request você receberá uma lista de produtos. Esta lista servirá para montar um pequeno carrossel de produtos. 

## Design

- A prateleira apresentada deve seguir o [seguinte design](desafio-front-end-itelios.jpg)
- Baseado neste layout, faça uma adaptação responsiva para celulares.

## Como realizar o teste

- Faça um fork deste repositório em seu GitHub
- Adicione ao Readme uma descrição de como executar seu projeto
- Descreva as funcionalidades do seu desafio, venda seu peixe! Por exemplo, se fez a prateleira com javascript puro, porém utilizou uma biblioteca para o carrossel, deixe isso no Readme. Se usou ES6 com um transpiler, conte isso pra gente. 
- Não há um limite de tempo, porém consideramos ideal não gastar mais que 8h neste desafio
- Faça commits parciais, para que possamos acompanhar o seu desenvolvimento.
- Em caso de dúvidas, entre em contato com flora.braz@itelios.com

## Dicas
 
- O ícone do botão é o add-shopping-plus, do Material Design. https://material.io/icons/
- A fontes utilizadas são Roboto Condensed Bold (títulos), Roboto Regular (texto corrido) e Roboto Bold (preço e preço parcelado). 
- We **<3** Vanilla Javascript. Tente executar este teste usando javascript puro. Só utilize bibliotecas como último recurso.
- We **<3** CSS responsivo, organizado, modular e feito com pré-processadores. Sinta-se livre para usar a arquitetura CSS que achar mais adequada. 
- Trabalhamos com clientes perfeccionistas, portanto tenha atenção com espaçamentos, tamanhos e estilos de fonte. 

## Critérios de avaliação

- Alcançar os objetivos propostos
- Qualidade de código
- Commits parciais, mostrando a linha de desenvolvimento
- Boa descrição das funcionalidades do desafio
- Não utilização de bibliotecas ou frameworks
- Fidelidade ao design proposto
- Adaptação mobile



# Desenvolvimento #


## Como executar o Projeto ##

1. Foi desenvolvido usando Grunt, instalado por NPM, então precisa ter o nodejs instalado na máquina/servidor. 
  * [Clique aqui](https://nodejs.org/) e veja como instalar o NodeJs. 
2. Baixe o zip ou clone o repositório deste fork
3. Navegue com o terminal de commandos até o diretório do repositório e execute o commando 'npm install' (o arquivo 'package.json' contem as informações dos arquivos a serem instalados pelo NPM)
4. Quando os 'node modules' estiverem instalados pode dar o commando 'grunt serve' para iniciar o servidor.
5. Tendo iniciado o servidor do grunt (sem servidor não da para consumir o json via xhttp) digite o endereço http://localhost:9000/index.html ou [clique aqui](http://localhost:9000/index.html) para visualizar o projeto.

## Descrição de Funcionalidades ##

O javascript do app.js feito por mim, é gerado de um arquivo coffeescript localizado na pasta '_source/scripts/' usando o módulo npm chamado 'grunt-contrib-coffee
'. Então usei o coffeescript como transpiler do javascript puro.
A prateleira foi gerada usando Vanilla JS encontrado no arquivo 'scripts/app.js', mas o carrossel foi gerado por uma biblioteca chamada 'slick JS', que depende da biblioteca Jquery.
Os estilos construidos de forma modular no scss e importado num único arquivo para produzir o arquivo 'styles/app.css', incluindo a biblioteca slick ('_source/styles/slick.scss' e '_source/styles/slick-theme.scss'), são gerados usando o módulo 'grunt-contrib-sass'.
Usei um arquivo index.html para inserir os dados da chamada xhttp usando um Vanila JS criado por mim no arquivo app.js.