require 'rails_helper'

RSpec.describe Category, type: :model do
  scenario 'Cria uma categoria válida' do
    category = create(:category)
    expect(category).to be_valid
  end

  scenario 'Category não pode ficar em branco' do
    category = build(:category, category: nil)
    category.valid?
    expect(category.errors[:category]).to include("não pode ficar em branco")
  end
end
