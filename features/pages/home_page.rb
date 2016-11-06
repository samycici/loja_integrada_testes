class HomePage < SitePrism::Page
  section :busca, BuscaSection, '#form-buscar'
  load_validation { has_busca? }

end
