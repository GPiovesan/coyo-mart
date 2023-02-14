require 'rails_helper'

feature "Products", type: :feature do
  scenario 'Verifica Link Produtos' do
    visit(root_path)
    expect(page).to have_link('Produtos')

  end

  scenario 'Verifica Link de Novo Produto' do
    visit(root_path)
    click_on('Produtos')
    expect(page).to have_content('Listando produtos')
    expect(page).to have_link('Novo produto')
  end

  scenario 'Verifica Formulário de Novo Produto' do
    visit(products_path)
    click_on('Novo produto')
    expect(page).to have_content('Descrição')
    
  end

  scenario 'Cadastra um Produto Válido' do
    product = create(:product)
    
    visit(new_product_path)
    fill_in('Descrição', with: product.description)
    select product.category.category, :from => "product[category_id]"
    select product.measure.measure, :from => "product[measure_id]"
    fill_in('Quantidade', with: Faker::Number.number(digits: 2)) 
    fill_in('Valor', with: Faker::Commerce.price) 
    
    attach_file("Foto do Produto", Rails.root + "spec/fixtures/computer.png")

    random_boolean = [true, false].sample
    find(:css, "#product_featured").set(random_boolean)
    
    print(html)
    click_on('btn-create-product')

    expect(page).to have_content('Produto cadastrado com sucesso')
    expect(Product.last.description).to eq(product.description)
  end

  scenario 'Cadastra um Produto Inválido' do
    product = create(:product)
    
    visit(new_product_path)
    select product.category.category, :from => "product[category_id]"
    select product.measure.measure, :from => "product[measure_id]"
    fill_in('Quantidade', with: Faker::Number.number(digits: 2)) 
    fill_in('Valor', with: Faker::Commerce.price) 
    
    click_on('btn-create-product')

    expect(page).to have_content('não pode ficar em branco')
  end

  scenario 'Verifica Pesquisa de produtos' do
    product = create(:product)
    visit(products_path)
    expect(page).to have_button('Pesquisar')
    
    fill_in('q[description_or_category_category_cont]', with: product.description)
    click_on('Pesquisar')

    expect(page).to have_content(product.description).and have_content(product.category.category)
  end
end
