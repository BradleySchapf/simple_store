require "csv"

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |product_row|
  # Find or create the category if needed
  category = Category.find_or_create_by(name: product_row['category'])

  # Create the product, assigning values from the CSV row
  Product.create(
    title: product_row['name'],
    description: product_row['description'],
    price: product_row['price'],
    stock_quantity: product_row['stock quantity'],
    category: category
  )

  puts product_row['name']
end

puts "seeded db successfully!"