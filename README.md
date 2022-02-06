# Recriando tela do App TodoMovies

## Descrição do Projeto
Criar uma replica da tela de detalhes do filme escolhido e listagem dos filmes semelhantes utilizando Swift.

<img src="https://is4-ssl.mzstatic.com/image/thumb/Purple114/v4/97/0e/e2/970ee217-13cf-1674-b016-461aca657663/pr_source.png/460x0w.png" width=250>

Foi utilizado a API [The Movie Database](https://www.themoviedb.org/) para trazer os detalhes do filme e os filmes similares.

## Arquitetura e padrões de projeto

- Foi aplicada a arquitetura MVVM. 
- Em `/View/Components` contém componentes que facilitam a organização e reutilização do código.
- Todas as chamdas na API foram feitas em `/model/MovieApi`.
- A ligação entre `View` e `model` foram feitas no arquivo `/ViewModel/MovieControllers`.
- Na pasta `/Utils` estão algumas extensions para facilitar a utilização de Strings e Images.


<img width="260" alt="Screen Shot 2022-02-05 at 11 11 02" src="https://user-images.githubusercontent.com/69813312/152645468-71eddb86-3133-41c0-89f0-d9ce9a0e23fa.png">

## Como rodar

- Rode esse comando no seu terminal `gitclone git@github.com:lemachegabriel/todomovie4.git` para clonar o repositório
- Abra o arquivo `todomovie4.xcodeporj`.
- Isira sua ApiKey nas variáveis ambiente.
- Pronto agora só rodar!!!!!!

## Resultado final


<img width="410" alt="Screen Shot 2022-02-05 at 11 07 36" src="https://user-images.githubusercontent.com/69813312/152652015-95c0f35c-6c06-4e93-9489-3116b506249f.png">



## Para o time Mobile2You.

Antes de verem o projeto queria agradecer pela oportunidade de participar desse processo seletivo, confesso que tive algumas dificuldades ao 
realizar essa tarefa, porém acredito que conquistei uma enorme evolução ao final do mesmo, percebi que ainda tenho muito a aprender e espero que possa
ser junto de vocês. Aguardo ansiosamente pelo feedback!