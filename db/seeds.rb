require 'faker'

# Clear out any existing data in the products table
Product.delete_all

# Create 676 products
676.times do
  Product.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),  # Adds some fake text for description
    price: Faker::Commerce.price(range: 5..500.0),           # Generates a price between $5 and $500
    stock_quantity: Faker::Number.between(from: 1, to: 100)  # Generates a stock quantity between 1 and 100
  )
end

puts "Seeded 676 products!"