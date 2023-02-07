FactoryBot.define do
  factory :product do
    description { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
    image { Rack::Test::UploadedFile.new "#{Rails.root}/spec/fixtures/computer.png" }
    stock_amount { Faker::Number.number(digits: 3) }
    featured { Faker::Boolean.boolean }
    category
    measure

    trait :with_category do
      category
    end
    
    trait :with_measure do
      measure
    end
  
    factory :product_with_category_and_measure, traits: [:with_category, :with_measure]
  end
end
