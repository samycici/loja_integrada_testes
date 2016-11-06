# language: pt
Funcionalidade: Busca

  Contexto: Estar na Loja Integrada
    Dado que eu esteja na Loja Integrada
    E que existam filmes cadastrados

  Cenário: Buscar um filme pelo nome completo
    Quando eu busco o filme "Senhor dos Anéis - As Duas Torres"
    Então visualizo o resultado de busca com apenas esse filme

  Cenário: Buscar um filme por parte do nome
    Quando eu busco o filme "Senhor dos Anéis"
    Então visualizo o resultado de busca com todos os filmes correspondentes a essa pesquisa

  Cenário: Buscar por um filme não cadastrado
    Dado que o fime "Homem Aranha" não esteja cadastrado
    Quando eu busco o filme "Homem Aranha"
    Então visualizo que minha busca não encontrou resultado
