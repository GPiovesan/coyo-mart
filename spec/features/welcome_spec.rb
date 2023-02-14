require 'rails_helper'

feature "Welcome", type: :feature do
  scenario 'Mostra a mensagem Dashboard!' do
    visit(root_path)
    expect(page).to have_content('Dashboard')
  end

  scenario 'Exibe o Link Produtos' do
    visit(root_path)
    expect(page).to have_link('Produtos')
  end
end
