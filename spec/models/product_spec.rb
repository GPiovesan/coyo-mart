require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Criação de produto válido' do
    scenario 'Criando produto válido' do
      product = create(:product_with_category_and_measure)
      expect(product).to be_valid
    end  
  end
  
  describe 'Criação de produtos inválidos' do
    scenario "Descrição" do
      product = build(:product_with_category_and_measure, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("não pode ficar em branco")
    end
    scenario "Preço" do
      product = build(:product_with_category_and_measure, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("não pode ficar em branco")
    end
    scenario "Foto" do
      product = build(:product_with_category_and_measure, image: nil)
      product.valid?
      expect(product.errors[:image]).to include("não pode ficar em branco")
    end
    scenario "Quantidade em Estoque" do
      product = build(:product_with_category_and_measure, stock_amount: nil)
      product.valid?
      expect(product.errors[:stock_amount]).to include("não pode ficar em branco")
    end
  end
end
