######### DADO #########
Dado(/^que eu esteja na Loja Integrada$/) do
  @home=HomePage.new
  @home.visit(CONFIG['url'])
end

Dado(/^que existam filmes cadastrados$/) do
end

Dado(/^que o fime "([^"]*)" não esteja cadastrado$/) do |arg1|
end

######### QUANDO #########
Quando(/^eu busco o filme "([^"]*)"$/) do |nome|
  @resultado_busca = @home.busca.buscar_filme nome
end

######### ENTãO #########
Então(/^visualizo o resultado de busca com apenas esse filme$/) do
  @resultado_busca.wait_for_resultado_busca_title
  qtd_resultados = @resultado_busca.qtd_resultados
  nome_resultados =  @resultado_busca.nome_resultados
  expect(qtd_resultados).to eq(1)
  expect(nome_resultados).to include("Bluray - Senhor dos Anéis - As Duas Torres")
end

Então(/^visualizo o resultado de busca com todos os filmes correspondentes a essa pesquisa$/) do
  @resultado_busca.wait_for_resultado_busca_title
  qtd_resultados = @resultado_busca.qtd_resultados
  nome_resultados =  @resultado_busca.nome_resultados
  expect(qtd_resultados).to eq(2)
  expect(nome_resultados).to include("Bluray - Senhor dos Anéis - As Duas Torres", "Bluray - Senhor dos Anéis - A Sociedade do Anel")
end

Então(/^visualizo que minha busca não encontrou resultado$/) do
  @resultado_busca.wait_for_resultado_busca_title
  mensagem = @resultado_busca.mensagem_busca_sem_resultados
  expect(mensagem).to include("Sua busca por: \"Homem Aranha\" não encontrou nenhum resultado")
end
