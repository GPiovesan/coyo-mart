require 'rails_helper'

RSpec.describe Product, type: :model do
  scenario 'Cria um produto válido' do
    product = create(:product)
    expect(product).to be_valid
  end

  scenario 'Um produto deve ter todos os campos preenchidos' do
    product = build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to include("não pode ficar em branco")
  end
end
