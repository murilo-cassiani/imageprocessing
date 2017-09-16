#include <FreeImage.h>


#ifndef IMAGEPROCESSING_H
#define IMAGEPROCESSING_H


typedef struct {
  unsigned int width, height;
  float *r, *g, *b;
} imagem;

imagem abrir_imagem(char *nome_do_arquivo);
void salvar_imagem(char *nome_do_arquivo, imagem *I);
void liberar_imagem(imagem *I);
void aplica_brilho(imagem *I, float brilho);
void divide(imagem *I, float brilho);
int maior_pixel(imagem *I);

#endif
