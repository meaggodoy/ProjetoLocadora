programa
{
	inclua biblioteca Texto --> t
	
  	//inicializar vetores
	funcao zerarDados(cadeia n[], inteiro a[], inteiro l[], inteiro v[]) {
		para (inteiro i = 0; i < 10; i++) {
			n[i] = " "
			a[i] = 0
			l[i] = 0
			v[i] = 0	
		}
	}

  	funcao cadeia transcreverLocado(inteiro lc) {
      	se (lc == 0) {
        		retorne "Não"
      	} senao {
        		retorne "Sim"
      	}
  	}

  	funcao apresentacao() {
		escreva("==============================================\n")
		escreva("BEM-VINDO À LOCADORA BUBSY GAMES\n")
		escreva("==============================================\n")
		escreva("Prepare a pipoca, ajuste o tracking do VHS e\n")
		escreva("escolha seu próximo grande sucesso!\n")
		escreva("----------------------------------------------\n")
		escreva("Nesta locadora, você pode:\n")
		escreva("Cadastrar filmes\n")
		escreva("Alugar e devolver títulos\n")
		escreva("Descobrir o filme mais alugado\n")
		escreva("Buscar por nome\n")
		escreva("Ver as estatísticas do acervo\n")
		escreva("----------------------------------------------\n")
		escreva("Carregando catálogo... pronto!\n")
		escreva("==============================================\n")
  	}

  	//função para apresentar o menu para o usuário
	funcao menuInicial(inteiro m, cadeia n[], inteiro a[], inteiro l[], inteiro v[], inteiro k) {
		faca {
			escreva("Selecione a opção desejada:")
			escreva("\n1 - Cadastrar filme \n2 - Listar filmes disponíveis \n3 - Filmes alugados \n4 - Alugar um filme \n5 - Devolver filme \n6 - Filme mais alugado \n7 - Buscar filme \n8 - Atualizar dados do filme \n9 - Estatísticas gerais \n10 - Sair do programa\n")
			leia(m)

		     escolha(m) {
		       caso 1:
		       cadastrarFilme(n, a, k)
		       pare
		       caso 2:
		       listarDisponiveis(n, a, l)
		       pare
		       caso 3:
		       filmesLocados(n, a, l)
		       pare
		       caso 4:
		       alugarFilme(n, l, v)
		       pare
		       caso 5:
		       devolverFilme(n, l)
		       pare
		       caso 6:
		       maisLocado(n, a, l, v)
		       pare
		       caso 7:
		       buscarFilme(n, a, l, v)
		       pare
		       caso 8:
		       atualizarFilme(n, a)
		       pare
		       caso 9:
		       estatisticas(n, l)
		       pare
		      }
          se (m > 10) {
            escreva("Opção inválida, digite novamente.\n")
            escreva("---------------------------------------------------\n")
          }
		} enquanto(m != 10)
		
		escreva("==============================================\n")
		escreva("Obrigado por utilizar a nossa LOCADORA!\n")
		escreva("Volte sempre para mais nostalgia!\n")
		escreva("==============================================\n")

	}

  	//função Cadastrar Filmes -> é possível o usuário cadastrar alguns filmes por vez
	funcao cadastrarFilme(cadeia n[], inteiro a[], inteiro &k) {
    inteiro continuarCadastro

    //para isso abrimos o laço com i equivalendo a k, que será a variável "memória" do laço
    escreva("================ CADASTRAR FILME ================\n")
    para (inteiro i = k; i < 10; i++) {
      se (k < 10) {
        escreva("Digite o nome do filme: ")
        leia(n[i])
        escreva("Digite o ano do filme: ")
        leia(a[i])

        k++ //incrementamos k para continuar a sequência

        //aqui perguntamos se deseja cadastrar um novo filme
        se (k < 10) {
          escreva("Deseja cadastrar um novo filme?\n1 - Sim | 2 - Não ")
          leia(continuarCadastro)
      
          //caso não, o laço será interrompido
          se (continuarCadastro == 2) {
            escreva("=================================================\n")
            pare
          }
        } senao {
          escreva("Limite da locadora atingido.\n")
        }
      } senao {
        escreva("Limite da locadora atingido.\n")
      }
      escreva("=================================================\n")
    }
	}

  	//função Listar os Filmes Disponíveis -> apresentamos apenas os filmes cadastrados
	funcao listarDisponiveis(cadeia n[], inteiro a[], inteiro l[]) {
		inteiro filme = 0
		
    		escreva("================ FILMES DISPONÍVEIS ================\n")
		para (inteiro i = 0; i < 10; i++) {
			se (n[i] != " ") {
				escreva("", i + 1, " | Nome do filme: ", n[i], " | Ano de lançamento: ", a[i], " | Locado: ", transcreverLocado(l[i]), "\n")

				filme++
			} 
		}
		se (filme == 0) {
			escreva("Nenhum filme disponível no acervo.\n")
		}
		
    		escreva("===================================================\n")
	}

  	//função Filmes Locados -> serão apresentados apenas aqueles filmes que tiverem sido alugados
	funcao filmesLocados(cadeia n[], inteiro a[], inteiro l[]) {
		inteiro filme = 0

		escreva("=============== FILMES LOCADOS ===============\n")
		para (inteiro i = 0; i < 10; i++) {
			se (l[i] != 0) {
				//usamos o vetor "locado" para condicionar a apresentação
				escreva("Nome do filme: ", n[i], " | Ano de lançamento: ", a[i], " | Locado: ", l[i])
				
				filme++
			}
		}

		se (filme == 0) {
			escreva("Nenhum filme está locado no momento.\n")
		}

		escreva("==============================================\n")
	}

	//função Alugar Filme -> usuário é capaz de escolher qual filme deseja alugar
	funcao alugarFilme(cadeia n[], inteiro l[], inteiro v[]) {
		inteiro id, filme = 0

		escreva("============== CATÁLOGO PARA LOCAÇÃO ==============\n")
		para (inteiro i = 0; i < 10; i++) {
			se (n[i] != " ") {
				se (l[i] == 0) {
					escreva(i + 1, " | Nome do filme: ", n[i], "\n")

					filme++
				}
			}
		}
		
		se (filme == 0) {
			//se não há filmes para serem locados, então finaliza
			escreva("Não há filmes disponíveis para locação.\n")
		} senao {
			//se há filmes para serem locados, perguntamos:
			escreva("---------------------------------------------------\n")
	
			//após a listagem dos filmes o usuário irá definir qual o filme pelo índice
			escreva("Digite o número do filme desejado: ")
			leia(id)
	
			//os status de "locado" e "vezes alugado" sofrem alterações, status muda para 1 = "sim" e é incrementado
			l[id - 1] = 1
			v[id - 1]++
			escreva("Você alugou: ", n[id - 1], "! Bom proveito!\n")
		}

		escreva("===================================================\n")
	}

	//função Devolver Filme -> o usuário poderá devolver apenas os filmes previamente locados
	funcao devolverFilme(cadeia n[], inteiro l[]) {
		inteiro id, filme = 0

		escreva("============== DEVOLVER FILME ==============\n")
		para (inteiro i = 0; i < 10; i++) {
			se (n[i] != " ") {
				se (l[i] == 1) {
					//apresentamos apenas os filmes que estão locados -> condicionados pelo vetor "locado"
					escreva(i + 1, " | Nome do filme: ", n[i], "\n")

					filme++
				}
			}
		}

		se (filme == 0) {
			//se não há filmes para serem devolvidos, então finaliza
			escreva("Não há filmes disponíveis para devolução.\n")
		} senao {
			//se há filmes para serem devolvidos, perguntamos:
			escreva("---------------------------------------------------\n")
			
			escreva("Digite a posição do filme para devolução: ")
			leia(id)
	
			//retornamos o status de locação para 0 = "não"
			l[id - 1] = 0
			escreva("O filme ", n[id - 1], " foi devolvido!\n")
		}

		escreva("===================================================\n")
	}

	//função Mais Locado -> apresenta o filme que foi alugado mais vezes, condicionado pelo vetor "vezesLocado"
	funcao maisLocado(cadeia n[], inteiro a[], inteiro l[], inteiro v[]) {
		inteiro contLocado = 0, contIndice = 0, filme = 0

		escreva("============= FILME MAIS LOCADO =============\n")
		
		//fazemos um contador e verificamos os valores do vetor
		para (inteiro i = 0; i < 10; i++) {
			se (v[i] > contLocado) {
				contIndice = i

				filme++
			}
		}

		se (filme == 0) {
			escreva("Nenhum resultado disponível.\n")
			escreva("Ainda não há filmes cadastrados ou nenhum deles foi alugado até o momento.\n")
		} senao {
			escreva("Nome do filme: ", n[contIndice], " | Ano de lançamento: ", a[contIndice], " | Locado: ", transcreverLocado(l[contIndice]), " | Vezes que foi alugado: ", v[contIndice], "\n")
		}
		escreva("===================================================\n")
	}

	//função Buscar Filme -> pela pesquisa do usuário iremos retornar se temos ou não o filme
	funcao buscarFilme(cadeia n[], inteiro a[], inteiro l[], inteiro v[]) {
		cadeia busca, igualarnomes
		logico resultado = falso

		escreva("============== BUSCA DE FILMES ==============\n")
		escreva("Qual filme você deseja? ")
		leia(busca)

		//deixar a resposta em letras minusculas
		busca = t.caixa_baixa(busca)
		
		para (inteiro i = 0; i < 10; i++) {
			se (n[i] != " ") {
				//deixar todos os nomes dos filmes em letras minusculas
				igualarnomes = t.caixa_baixa(n[i]) 

				//com a busca e o filme "iguais" usamos a função para verificar a equivalência entre as variáveis
				se (t.posicao_texto(busca, igualarnomes, 0) >= 0) {
					escreva("----------------------------------------------\n")
					escreva("Filme encontrado:\n")
					escreva("Nome do filme: ", n[i], " | Ano de lançamento: ", a[i], " | Locado: ", transcreverLocado(l[i]), " | Quantidade de vezes locado: ", v[i])
					resultado = verdadeiro
				}
			}
		}

		se (resultado == falso) {
			escreva("----------------------------------------------\n")
			escreva("Nenhum filme correspondente encontrado.")
		}

		escreva("\n===================================================\n")
	}

	///funcao Atualizar Filme -> o usuário escolhe qual filme deseja atualizar e o que irá atualizar (nome ou ano)
	funcao atualizarFilme(cadeia n[], inteiro a[]) {
		inteiro id, op, filme = 0

		escreva("=============== ATUALIZAR FILME ===============\n")
		escreva("Filmes disponíveis:\n")
		para (inteiro i = 0; i < 10; i++) {
			se (n[i] != " ") {
				escreva(i + 1, " | Nome do filme: ", n[i], " | Ano: ", a[i], "\n")

				filme++
			}
		}
		se (filme == 0) {
			//se não há filmes cadastrados não tem como atualizar nenhum
			escreva("Não há filmes disponíveis atualização.\n")
		} senao {
			escreva("----------------------------------------------\n")

			escreva("Selecione o índice do filme que deseja alterar:")
			leia(id)
			escreva("O que você deseja atualizar? \n1 - Nome e ano | 2 - Apenas o nome | 3 - Apenas o ano :")
			leia(op)
	
			escolha(op) {
				caso 1:
				escreva("Nome: ")
				leia(n[id - 1])
				escreva("Ano: ")
				leia(a[id - 1])
				pare
				caso 2:
				escreva("Nome: ")
				leia(n[id - 1])
				pare
				caso 3:
				escreva("Ano: ")
				leia(a[id - 1])
				pare
			}
			escreva("Dados atualizados com sucesso!\n")
			escreva(id, " | Nome do filme: ", n[id - 1], " | Ano: ", a[id - 1], "\n")
		}
		
		escreva("===================================================\n")
	}

	//função Estatísticas -> apresenta quantos filmes foram cadastrados, quantos estão locados e a ocupação da locadora
	funcao estatisticas(cadeia n[], inteiro l[]) {
		inteiro contL = 0
		real ocupacao = 0.0, contN = 0.0

		escreva("=============== ESTATÍSTICAS GERAIS ===============\n")

		para (inteiro i = 0; i < 10; i++) {
			//para contar a quantidade de filmes cadastrados, ele percorre o vetor nos índices diferentes de vazio e incrementa o contador
			se (n[i] != " ") {
				contN++
			}
			//para contar a quantidade de filmes locados, ele percorre o vetor nos índices iguais a 1 (equivale a "sim") e incrementa o contador
			se (l[i] == 1) {
				contL++
			}
		}
		ocupacao = contN * 10

		se (contN > 0) {
			escreva("Quantidade de filmes: ", contN, "\nQuantidade de filmes locados: ", contL, "\nOcupação total da locadora: ", ocupacao, "%")	
		} senao {
			escreva("Nenhum filme cadastrado no sistema.")
		}
		escreva("\n===================================================\n")
	}
	
	funcao inicio()
	{
		cadeia nomeFilme[10]
		inteiro ano[10], locado[10], vezesAlugado[10], menu = 0, k = 0

		//funcao para inicializar as posições vetoriais
		zerarDados(nomeFilme, ano, locado, vezesAlugado)

		apresentacao()
    		//função para apresentar o menu ao usuário
		menuInicial(menu, nomeFilme, ano, locado, vezesAlugado, k)
	}
}
