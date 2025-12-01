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

  	//função para apresentar o menu para o usuário
	funcao menuInicial(inteiro m, cadeia n[], inteiro a[], inteiro l[], inteiro v[], inteiro k) {
		faca {
			escreva("Selecione a opção desejada:")
			escreva("\n1 - Cadastrar filme | 2 - Listar filmes disponíveis | 3 - Filmes alugados | 4 - Alugar um filme | 5 - Devolver filme \n6 - Filme mais alugado | 7 - Buscar filme | 8 - Atualizar dados do filme | 9 - Estatísticas gerais | 10 - Sair do programa | ")
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
            escreva("Escolha novamente.")
          }
		} enquanto(m != 10)
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
		
    		escreva("================ FILMES DISPONÍVEIS ================")
		para (inteiro i = 0; i < 10; i++) {
			se (n[i] != " ") {
				escreva("\n", i + 1, " | Nome do filme: ", n[i], " | Ano de lançamento: ", a[i], " | Locado: ", transcreverLocado(l[i]), "\n")

				filme++
			} 
		}
		se (filme == 0) {
			escreva("Nenhum filme disponível no acervo.")
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

	funcao maisLocado(cadeia n[], inteiro a[], inteiro l[], inteiro v[]) {
		inteiro contLocado = 0, contIndice = 0

		para (inteiro i = 0; i < 10; i++) {
			se (v[i] > contLocado) {
				contIndice = i
			}
		}

		escreva("O filme mais alugado foi:\n")
		escreva("Nome do filme: ", n[contIndice], " | Ano de lançamento: ", a[contIndice], " | Locado: ", transcreverLocado(l[contIndice]), " | Vezes que foi alugado: ", v[contIndice])
	}

	funcao buscarFilme(cadeia n[], inteiro a[], inteiro l[], inteiro v[]) {
		cadeia busca, igualarnomes
		logico resultado = falso
		
		escreva("Qual filme você deseja? ")
		leia(busca)

		busca = t.caixa_baixa(busca)//deixar a resposta em letras minusculas
		
		para (inteiro i = 0; i < 10; i++) {
			se (n[i] != " ") {
				igualarnomes = t.caixa_baixa(n[i])//deixar todos os nomes dos filmes em letras minusculas
				se (t.posicao_texto(busca, igualarnomes, 0) >= 0) {
					escreva("Nome do filme: ", n[i], " | Ano de lançamento: ", a[i], " | Locado: ", l[i], " | Quantidade de vezes locado: ", v[i])
					resultado = verdadeiro
				}
			}
		}

		se (resultado == falso) {
			escreva("Não temos o filme")
		}
	}

	funcao atualizarFilme(cadeia n[], inteiro a[]) {
		inteiro id, op
		
		escreva("Filmes disponíveis:\n")
		para (inteiro i = 0; i < 10; i++) {
			se (n[i] != " ") {
				escreva(i, " | Nome do filme: ", n[i], " | Ano: ", a[i], "\n")
			}
		}

		escreva("Qual índice você deseja atualizar? ")
		leia(id)
		escreva("O que você deseja atualizar? \n1 - Nome e ano | 2 - Apenas o nome | 3 - Apenas o ano ")
		leia(op)

		escolha(op) {
			caso 1:
			escreva("Nome: ")
			leia(n[id])
			escreva("Ano: ")
			leia(a[id])
			pare
			caso 2:
			escreva("Nome: ")
			leia(n[id])
			pare
			caso 3:
			escreva("Ano: ")
			leia(a[id])
			pare
		}
	}

	funcao estatisticas(cadeia n[], inteiro l[]) {
		inteiro contL = 0
		real ocupacao = 0.0, contN = 0.0

		para (inteiro i = 0; i < 10; i++) {
			se (n[i] != " ") {
				contN++
			}
			se (l[i] == 1) {
				contL++
			}
		}
		ocupacao = contN * 10

		se (contN > 0) {
			escreva("Estatísticas:\nQuantidade de filmes: ", contN, "\nQuantidade de filmes locados: ", contL, "\nOcupação total da locadora: ", ocupacao, "%")	
		} senao {
			escreva("Nenhum filme cadastrado.")
		}
	}
	
	funcao inicio()
	{
		cadeia nomeFilme[10]
		inteiro ano[10], locado[10], vezesAlugado[10], menu = 0, k = 0

		//funcao para inicializar as posições vetoriais
		zerarDados(nomeFilme, ano, locado, vezesAlugado)

    		//função para apresentar o menu ao usuário
		menuInicial(menu, nomeFilme, ano, locado, vezesAlugado, k)
	}
}
