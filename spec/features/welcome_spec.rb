require 'rails_helper'

feature "Welcome", type: :feature do
  scenario 'Mostra a mensagem Bem-Vindo!' do
    visit(root_path)
    expect(page).to have_content('Bem-Vindo!')
  end

  scenario 'Exibe o Link Produtos' do
    visit(root_path)
    expect(page).to have_link('Produtos')
  end
end
