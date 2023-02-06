json.extract! product, :id, :description, :price, :image, :stock_amount, :featured, :category_id, :measure_id, :created_at, :updated_at
json.url product_url(product, format: :json)
