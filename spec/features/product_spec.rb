require 'rails_helper'

feature "Products", type: :feature do
  scenario 'Verifica Link Produtos' do
    visit(root_path)
    expect(page).to have_link('Produtos')

  end

  scenario 'Verifica Link de Novo Produto' do
    visit(root_path)
    click_on('Produtos')
    expect(page).to have_content('Listando Produtos')
    expect(page).to have_link('Novo Produto')
  end

  scenario 'Verifica Formulário de Novo Produto' do
    visit(products_path)
    click_on('Novo Produto')
    expect(page).to have_content('Descrição')
  end

  scenario 'Cadastra um Produto Válido' do
    visit(new_product_path)
    product_name = Faker::Commerce.product_name
    
    fill_in('Descrição', with: product_name)
    fill_in('Categoria', with: Faker::Commerce.department)
    fill_in('Preço', with: Faker::Commerce.price) 
    click_on('Criar Produto')

    expect(page).to have_content('Produto cadastrado com sucesso')
    expect(Product.last.name).to eq(product_name)
  end

  scenario 'Cadastra um Produto Inválido' do
    
  end
end
