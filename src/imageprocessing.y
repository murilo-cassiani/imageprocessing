%{
#include <stdio.h>
#include "imageprocessing.h"
#include <FreeImage.h>
void yyerror(char *c);
int yylex(void);
%}
%union {
  char    strval[50];
  int     ival;
  float		fval;
}
%token <strval> STRING
%token <ival> VAR IGUAL EOL ASPA MULT DIV ABRE_COLCHETE FECHA_COLCHETE
%token <fval> FLOAT
%left SOMA

%%

PROGRAMA:
  PROGRAMA EXPRESSAO EOL
  |
  ;

EXPRESSAO:
	STRING IGUAL STRING {
    printf("Copiando %s para %s\n", $3, $1);
    imagem I = abrir_imagem($3);
    printf("Li imagem %d por %d\n", I.width, I.height);
    salvar_imagem($1, &I);
    liberar_imagem(&I);
	}
	| STRING IGUAL STRING MULT FLOAT {
		printf("Aplicação de brilho %f vezes de %s para %s\n", $5, $3, $1);
    imagem I = abrir_imagem($3);
    printf("Li imagem %d por %d\n", I.width, I.height);
    aplica_brilho(&I, $5);
    printf("Apliquei brilho de %f vezes\n", $5);
    salvar_imagem($1, &I);
    liberar_imagem(&I);
	}
	|	STRING IGUAL STRING DIV FLOAT {
		printf("Aplicação do brilho de %f dividindo de %s para %s\n", $5, $3, $1);
    imagem I = abrir_imagem($3);
    printf("Li imagem %d por %d\n", I.width, I.height);
		divide(&I, $5);
    printf("Apliquei brilho de %f dividindo\n", $5);
    salvar_imagem($1, &I);
    liberar_imagem(&I);
	}
	|	ABRE_COLCHETE STRING FECHA_COLCHETE {
		imagem I = abrir_imagem($2);
		int maior_soma = maior_pixel(&I);
		printf("O valor máximo dentre todos os pixels de %s é %d\n", $2, maior_soma);
	}
	;

%%

void yyerror(char *s) {
  fprintf(stderr, "%s\n", s);
}

int main() {
  FreeImage_Initialise(0);
  yyparse();
  return 0;
}
