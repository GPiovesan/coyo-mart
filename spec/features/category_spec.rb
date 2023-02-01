require 'rails_helper'

feature "Categories", type: :feature do
  scenario 'Verifica Link Categorias em root' do
    visit(root_path)
    expect(page).to have_link('Categorias')
  end

  scenario 'Verifica link Nova Categoria' do
    visit(root_path)
    click_on('Categorias')
    expect(page).to have_content('Listando Categorias')
    expect(page).to have_link('Nova Categoria')
  end
end
