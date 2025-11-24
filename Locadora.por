programa
{
  	//inicializar vetores
	funcao zerarDados(cadeia n[], inteiro a[], inteiro l[], inteiro v[]) {
		para (inteiro i = 0; i < 10; i++) {
			n[i] = " "
			a[i] = 0
			l[i] = 0
			v[i] = 0	
		}
	}

  	//função para apresentar o menu para o usuário
	funcao menuInicial(inteiro m, cadeia n[], inteiro a[], inteiro l[], inteiro v[]) {
		faca {
			escreva("Selecione a opção desejada:")
			escreva("\n1 - Cadastrar filme | 2 - Listar filmes disponíveis | 3 - Filmes alugados | 4 - Alugar um filme | 5 - Devolver filme \n6 - Filme mais alugado | 7 - Buscar filme | 8 - Atualizar dados do filme | 9 - Estatísticas gerais | 10 - Sair do programa | ")
			leia(m)

      escolha(m) {
        caso 1:
        cadastrarFilme(n, a)
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
      }
		} enquanto(m != 10)
		
	}

  	//função da primeira opção: cadastrar filmes
	funcao cadastrarFilme(cadeia n[], inteiro a[]) {
		para (inteiro i = 0; i < 3; i++) {
			escreva("Digite o nome do filme: ")
			leia(n[i])
			escreva("Digite o ano do filme: ")
			leia(a[i])
		}
	}

  	//função da segunda opção: listar os filmes disponíveis
	funcao listarDisponiveis(cadeia n[], inteiro a[], inteiro l[]) {
		para (inteiro i = 0; i < 10; i++) {
			se (n[i] != " ") {
				escreva("Nome do filme: ", n[i], " | Ano de lançamento: ", a[i], " | Locado: ", l[i])
			} senao {
				escreva("Nenhum filme disponível.\n")
				i = 10
			}
		}
	}

  	//função da terceira opção: listar os filmes que estão alugados
	funcao filmesLocados(cadeia n[], inteiro a[], inteiro l[]) {
		inteiro filme = 0
		
		para (inteiro i = 0; i < 10; i++) {
			se (l[i] != 0) {
				escreva("Nome do filme: ", n[i], " | Ano de lançamento: ", a[i], " | Locado: ", l[i])
				filme++
			}
		}

		se (filme == 0) {
			escreva("Nenhum filme alugado")
		}
	}

	funcao alugarFilme(cadeia n[], inteiro l[], inteiro v[]) {
		inteiro id

		escreva("Filmes disponíveis:\n")
		para (inteiro i = 0; i < 10; i++) {
			se (n[i] != " ") {
				se (l[i] == 0) {
					escreva(i, " | Nome do filme: ", n[i], "\n")
				}
			}
		}

		escreva("Digite a posição do filme para locação: ")
		leia(id)

		l[id] = 1
		v[id]++
		escreva("O filme ", n[id], " foi locado!")
	}

	funcao devolverFilme(cadeia n[], inteiro l[]) {
		inteiro id

		escreva("Filmes alugados:\n")
		para (inteiro i = 0; i < 10; i++) {
			se (n[i] != " ") {
				se (l[i] == 1) {
					escreva(i, " | Nome do filme: ", n[i], "\n")
				}
			}
		}

		escreva("Digite a posição do filme para devolução: ")
		leia(id)

		l[id] = 0
		escreva("O filme ", n[id], " foi devolvido!")
	}

	funcao maisLocado(cadeia n[], inteiro a[], inteiro l[], inteiro v[]) {
		inteiro contLocado = 0, contIndice = 0

		para (inteiro i = 0; i < 10; i++) {
			se (v[i] > contLocado) {
				contIndice = i
			}
		}

		escreva("O filme mais alugado foi:\n")
		escreva("Nome do filme: ", n[contIndice], " | Ano de lançamento: ", a[contIndice], " | Locado: ", l[contIndice], " | Vezes que foi alugado: ", v[contIndice])
	}
	
	funcao inicio()
	{
		cadeia nomeFilme[10]
		inteiro ano[10], locado[10], vezesAlugado[10], menu = 0

		//funcao para inicializar as posições vetoriais
		zerarDados(nomeFilme, ano, locado, vezesAlugado)

    		//função para apresentar o menu ao usuário
		menuInicial(menu, nomeFilme, ano, locado, vezesAlugado)
		
	}
}
