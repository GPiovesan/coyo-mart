require 'rails_helper'

feature "Dashboard", type: :feature do
  scenario 'Mostra a mensagem Dashboard!' do
    visit(root_path)
    expect(page).to have_content('Dashboard')
  end

  scenario 'Exibe o Link Produtos' do
    visit(root_path)
    expect(page).to have_link('Produtos')
  end

  scenario 'Exibe o Link Categorias' do
    visit(root_path)
    expect(page).to have_link('Categorias')
  end

  scenario 'Carrega lista de produtos em destaque' do
    product = create(:product, featured: true)
    visit(root_path)
    expect(page).to have_content('Listagem de Produtos em Destaque')
    expect(page).to have_content(product.description)
  end

  scenario 'Verifica filtro de produtos em destaque no Dashboard' do
    # Cria um novo produto que não esteja em destaque
    product = create(:product, featured: false)
    visit(root_path)
    # O dashboard deve trazer apenas produtos em destaque
    expect(page).to have_no_content(product.description)
  end

  scenario 'Contagem de produtos cadastrados' do
    product = create(:product)
    visit(root_path)
    expect(find("/html/body/main/div[@class='info']/div[@class='info-box'][1]/div[@class='info-box-content']/p[@class='info-counter']").text).to eq('1')
  end
end
