#include <stdio.h>
#include "cuda_runtime.h"

#define TAM_MAP 30

//Kernel
__global__
void projecao_x(int *p_param){
	printf("video: %d\n",*p_param);	
	*p_param += 5; /*muda valor*/
}


int main(){
	int valor;
        valor = 10; /* declaração da variavel alocada no pc*/
	cudaDeviceReset();
	
	int *d_param; /*Declaracao da variavel alocado na placa de video*/
	

	/*alocação de variaveis da placa de vídeos*/
	cudaMalloc((void**)&d_param,sizeof(int));         /*aloca na cuda o tamanho de 1 inteiro*/

	
	cudaMemcpy( d_param, &valor,
                              sizeof(int),
	                      cudaMemcpyHostToDevice);

	printf("Chamando hello!\n");
	projecao_x << <1, 1>> >(d_param); /*Criação funcao do processador*/
	cudaDeviceSynchronize();
	cudaMemcpy( &valor, d_param,
                             sizeof(int),
                             cudaMemcpyDeviceToHost);
	printf("pc:%d\n",valor);
	cudaFree(d_param);
	return 0;
}
