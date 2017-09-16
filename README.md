# Trabalho 1: Uma linguagem para processamento de imagens

Embora linguagens de programação de propósito geral sejam bastante poderosas,
elas também podem ser entendidas como muito complicadas. Por esse motivo, já
foram inventadas linguagens de programação voltadas a público específico. Uma
linguagem de nicho bastante famosa é MatLab, cuja sintaxe favorece os cálculos
envolvendo matrizes e tensores e oculta o processo de alocação/desalocação de
memória.

Neste trabalho, realizamos a implementação de uma linguagem de programação
voltada para o processamento de imagens digitais. Julgamos que as bibliotecas
para processamento de imagens são muito complicadas, por isso fornecemos
uma interface mais intuitiva ao nosso usuário. Mais especificamente,
implementamos um operador `brilho` para nossos usuários.

## Conteúdo desde diretório
Neste diretório, temos alguns arquivos e uma versão funcional,
de nossa linguagem. Ao rodar o `make`, o nosso interpretador compila. Para isso,
você vai precisar garantir que sua máquina tem instalados os seguintes
pacotes:
* Lex (ou Flex)
* Bison
* libfreeimage-dev

Depois, execute o interpretador usando `./main`. Ao digitar:

`teste.jpg = demo.jpg`

o programa abrirá o arquivo `demo.jpg`, copiará seu conteúdo para uma estrutura
intermediária (veja no arquivo `src/imageprocessing.h` o conteúdo dessa estrutura), e então
salvará o conteúdo para o arquivo `teste.jpg`.

Os arquivos Lex e Bison estão no diretório `src/`. Também, lá temos o arquivo
`imageprocessing.h`, que define estruturas e funções que são usadas no programa.
Preste atenção em especial à `struct imagem`, que armazena o conteúdo de
imagens. Essencialmente, ela guarda a altura (height), largura (width) e o
conteúdo dos pixels nos canais red, green e blue.

Veja no arquivo `src/lib_imageprocessing.c` como essa estrutura é usada na
prática.

## Brilho
Aplicar *brilho* à imagem significa multiplicar o valor de seus pixels por uma
constante. A sintaxe para o brilho é a de um rótulo de arquivo
multiplicado ou dividido por um valor float, como por exemplo:

* `teste.jpg = demo.jpg * 0.5`
* `teste.jpg = demo.jpg * 1.0`
* `teste.jpg = demo.jpg / 2`

## Valor máximo
O operador valor máximo retorna o valor máximo dos pixels da imagem. A
sintaxe para isso é o nome do arquivo cercado de colchetes, ou seja:

* `[teste.jpg]`

escreve na tela o valor máximo entre todos os valores dos pixels de
`teste.jpg`.



