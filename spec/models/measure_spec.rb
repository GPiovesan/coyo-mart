require 'rails_helper'

RSpec.describe Measure, type: :model do
  scenario 'Cria uma medida válida' do
    measure = create(:measure)
    expect(measure).to be_valid
  end

  scenario 'Unidade de Medida não pode ficar em branco' do
    measure = build(:measure, measure: nil)
    measure.valid?
    expect(measure.errors[:measure]).to include("não pode ficar em branco")
  end
end
