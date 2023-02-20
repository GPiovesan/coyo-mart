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
    click_on('Nova Categoria')
    expect(page).to have_content('Nova Categoria')
  end

  scenario 'Cadastra uma categoria válida' do
    new_category = create(:category)
    
    visit(new_category_path)
    fill_in('Categoria', with: new_category.category)

    click_on('btn-create-product')

    expect(page).to have_content('Categoria cadastrada com sucesso')
    expect(Category.last.category).to eq(new_category.category)
  end

  scenario 'Cadastra uma categoria inválida' do
    visit(new_category_path)
    
    click_on('btn-create-product')

    expect(page).to have_content('Categoria não pode ficar em branco')
  end

  scenario 'Edita uma categoria' do
    category = create(:category)

    new_category = Faker::Commerce.department
    visit(category_path(category.id))
    click_link('Editar')
    fill_in('Categoria', with: new_category)

    click_on('btn-save-product')

    expect(page).to have_content('Categoria atualizada com sucesso.')
    expect(page).to have_content(new_category)
  end

  scenario 'Excluindo uma categoria' do
    category = create(:category)
    visit(category_path(category.id))
    expect(page).to have_content('Exibindo Categoria')
    find(:xpath, "/html/body/main/div[2]/form[@class='button_to']/button").click
    expect(page).to have_content('Categoria excluída com sucesso.')
  end
end
