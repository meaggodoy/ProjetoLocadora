programa
{
	
	funcao inicio()
	{
		cadeia nomeFilmes[5]
		inteiro anoLancamento[5], qtdLocado[5],locado[5], opcaoMenu

		//menu inicial
		inicializarVetores(nomeFilmes,anoLancamento,qtdLocado,locado)
		
		faca{
			faca{
				
				escreva("\n-------------Menu-------------\n")
				escreva("1 -> Cadastrar filme\n2 -> Listar filme locados e disponiveis\n3 -> Filmes Locados\n4 -> Alugar um filme\n")
				escreva("5 -> Devolver um filme\n6 -> Filme mais locado\n7 -> Buscar um filme pelo nome\n8 -> Atualizar dados de um filme\n")
				escreva("9 -> Estatisticas Gerais\n10 -> Sair do Programa\n")
				leia(opcaoMenu)
				se(opcaoMenu < 0 ou opcaoMenu > 10){
					escreva("\nDigite um numero de menu valido!")
				}
			}enquanto(opcaoMenu < 0 ou opcaoMenu > 10)
			limpa()
	
			//Cadastrar Filme em um indice - nº1
			escolha(opcaoMenu){
				caso 1:
				cadastrarFilme(nomeFilmes,anoLancamento,qtdLocado,locado)
				pare
				caso 2:
				listarFilmes(nomeFilmes,anoLancamento,qtdLocado,locado)
				pare
				caso 3:
				filmesLocados(nomeFilmes,locado)
				pare
				caso 4:
				alugarFilme(nomeFilmes,qtdLocado,locado)
				pare
				caso 5:
				devolverFilme(nomeFilmes, locado)
				pare
				
			}	
			
		}enquanto(opcaoMenu != 10)
			
	
	}
	
	funcao inicializarVetores(cadeia nomeFilmes[], inteiro anoLancamento[], inteiro qtdLocado[], inteiro locado[]){
		para (inteiro i = 0; i < 5; i++) {
			nomeFilmes[i] = " "
			anoLancamento[i] = 0
			qtdLocado[i] = 0
			locado[i] = 0	
		}
	}
	
	funcao cadastrarFilme(cadeia nomeFilmes[], inteiro anoLancamento[], inteiro qtdLocado[], inteiro locado[]){
		inteiro indice
		faca{
			escreva("\nQual indice do filme que sera cadastrado?(ESCOLHA DE 0 A 5)")
			leia(indice)
		}enquanto(indice < -1 ou indice > 9)
		
		escreva("Digite o nome do filme:\n")
		leia(nomeFilmes[indice])
		escreva("Digite seu ano de lançamento:\n")
		leia(anoLancamento[indice])
		qtdLocado[indice]=0
		locado[indice]=0
		limpa()	
	}

	funcao listarFilmes(cadeia nomeFilmes[], inteiro anoLancamento[], inteiro qtdLocado[], inteiro locado[]){
		inteiro filme=0 // variavel pra mostrar se tem filme cadastrado ou nao
		
		para(inteiro i = 0; i < 5;i++){
			se(nomeFilmes[i] != " "){
				escreva("\nIndice: ",i)
				escreva("\nFilme: ",nomeFilmes[i],"\nData de lançamento: ",anoLancamento[i])
				escreva("\nQuantidade de vezes alugado: ",qtdLocado[i],"\nDisponibilidade: ")
				//verificar condição do filme ( se esta alugado ou nao)
				se(locado[i] == 1){
					escreva("ALUGADO")
				}
				senao se(locado[i] == 0){
					escreva("Disponivel para locação")
				}
				escreva("\n")
				filme = 1	
			}
		}
		se(filme == 0 ){
			escreva("\nNenhum filme cadastrado")
		}
	}

	funcao filmesLocados(cadeia nomeFilmes[], inteiro locado[]){
		inteiro filme = 0
		//Criei a variavel filmeLocados para fazer um contador, caso contador seja 0 ele diz q todos os filmes estao disponiveis
		para(inteiro i = 0; i < 5;i++){	
			se(locado[i] == 1){
				escreva("\n",nomeFilmes[i])
				filme++	
			}	
		}
		se(filme == 0){
			escreva("\nNenhum filme esta alugado")	
		}
	}

	funcao alugarFilme(cadeia nomeFilmes[], inteiro qtdLocado[],inteiro locado[]){
		inteiro indice
		para(inteiro i = 0; i < 5;i++){	
				se(locado[i] == 0){
					escreva("\nO filme ",i, nomeFilmes[i]," está disponivel.\n")
				}
		}
		//Seleciona qual filme deseja alugar	
		escreva("\nDigite qual Indice do filme que deseja alugar:\n")
		leia(indice)
		//passar a locacao para valor 1, que quer dizer que esta alugado!
		locado[indice]=1
		qtdLocado[indice]++
		escreva("\nO filme, ",nomeFilmes[indice]," foi alugado!\n")			
	}

	funcao devolverFilme(cadeia nomeFilmes[], inteiro locado[]){
		inteiro indice
		para(inteiro i = 0; i < 5;i++){	
			se(locado[i] == 1){
				escreva("\nO filme ",i , nomeFilmes[i]," está locado.\n")
			}
		}
		//Seleciona qual filme deseja devolver	
		escreva("\nDigite qual Indice do filme que deseja devolver:\n")
		leia(indice)
		//passar a locacao para valor 0, que quer dizer que esta disponivel!
		locado[indice]=0
		escreva("\nO filme, ",nomeFilmes[indice]," foi devolvido!\n")
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 117; 
 * @DOBRAMENTO-CODIGO = [50, 59, 75, 99, 113, 129];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {nomeFilmes, 60, 30, 10}-{anoLancamento, 60, 52, 13}-{qtdLocado, 60, 77, 9}-{locado, 60, 98, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
