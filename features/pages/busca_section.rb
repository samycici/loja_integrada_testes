class BuscaSection < SitePrism::Section
  element :input_busca, '#auto-complete'
  element :btn_buscar, '#form-buscar > button'

  def buscar_filme nome
    input_busca.set nome
    btn_buscar.click
    ResultadoBuscaPage.new
  end

end
