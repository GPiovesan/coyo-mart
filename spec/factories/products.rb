FactoryBot.define do
  factory :product do
    description { Faker::Commerce.product_name }
    price { Faker::Commerce.price }

    image { Rack::Test::UploadedFile.new "#{Rails.root}/spec/fixtures/computer.png", "image/jpg" }

    stock_amount { Faker::Number.number(digits: 3) }
    featured { Faker::Boolean.boolean }
    category
    measure
  end
end
