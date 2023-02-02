FactoryBot.define do
  factory :category do
    category { Faker::Commerce.department }
  end
end
