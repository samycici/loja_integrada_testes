class ResultadoBuscaPage < SitePrism::Page
  elements :listagem_produtos, '#listagemProdutos > ul > li > ul > li'
  elements :nome_produtos, '#listagemProdutos > ul > li > ul > li > div > div.info-produto > a'
  element :mensagem_0_resultados, :xpath, '//*[@id="corpo"]/div/div[2]/div[2]/h1'
  section :busca, BuscaSection, '#form-buscar'
  element :resultado_busca_title, '#corpo > div > div.breadcrumbs.borda-alpha > ul > li:nth-child(2) > strong'

  def qtd_resultados
    listagem_produtos.size
  end

  def nome_resultados
    nomes = nome_produtos.map {|nome| nome.text}
  end

  def mensagem_busca_sem_resultados
    mensagem_0_resultados.text
  end
end
