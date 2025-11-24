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
	funcao menuInicial(inteiro m, cadeia n[], inteiro a[], inteiro l[]) {
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
      }
		} enquanto(m != 10)
		
	}

  //função da primeira opção: cadastrar filmes
	funcao cadastrarFilme(cadeia n[], inteiro a[]) {
		para (inteiro i = 0; i < 10; i++) {
			escreva("Digite o nome do filme")
			leia(n[i])
			escreva("Digite o ano do filme")
			leia(a[i])
		}
	}

  //função da segunda opção: listar os filmes disponíveis
	funcao listarDisponiveis(cadeia n[], inteiro a[], inteiro l[]) {
		para (inteiro i = 0; i < 10; i++) {
			se (n[i] != " ") {
				escreva("Nome do filme: ", n[i], " | Ano de lançamento: ", a[i], " | Locado: ", l[i])
			} senao {
				escreva("Nenhum filme disponível\n")
				i = 10
			}
		}
	}

  //função para listar os filmes que estão alugados
	funcao filmesLocados(cadeia n[], inteiro a[], inteiro l[]) {
		para (inteiro i = 0; i < 10; i++) {
			se (l[i] != 0) {
				escreva("Nome do filme: ", n[i], " | Ano de lançamento: ", a[i], " | Locado: ", l[i])
			} senao {
				escreva("Nenhum filme alugado\n")
				i = 10
			}
		}
	}
	
	funcao inicio()
	{
		cadeia nomeFilme[10]
		inteiro ano[10], locado[10], vezesAlugado[10], menu = 0

		//funcao para inicializar as posições vetoriais
		zerarDados(nomeFilme, ano, locado, vezesAlugado)

    //função para apresentar o menu ao usuário
		menuInicial(menu, nomeFilme, ano, locado)
		
	}
}
