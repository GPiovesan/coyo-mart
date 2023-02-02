require 'rails_helper'

feature "Categories", type: :feature do
  scenario 'Verifica Link Categorias em root' do
    visit(root_path)
    expect(page).to have_link('Categorias')
  end

  scenario 'Link Nova Categoria' do
    visit(root_path)
    click_on('Categorias')
    expect(page).to have_content('Listando Categorias')
    expect(page).to have_link('Nova Categoria')
  end

  scenario 'Formulário de Nova Categoria' do
    visit(categories_path)
    click_link('Nova Categoria')
    expect(page).to have_button('Criar Categoria')
  end

  scenario 'Cadastra uma categoria válida' do
    visit(new_category_path)
    category_name = Faker::Commerce.department
    
    fill_in('Categoria', with: category_name)
    click_on('Criar Categoria')

    expect(page).to have_content('Categoria cadastrada com sucesso')
    expect(Category.last.category).to eq(category_name)
  end

  scenario 'Cadastra um Produto Inválido' do
    visit(new_category_path)
    
    click_on('Criar Categoria')

    expect(page).to have_content('Categoria não pode ficar em branco')
  end
end
