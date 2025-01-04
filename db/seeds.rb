# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Categories for merch
["Clothing", "Accessories", "Electronics", "Footwear"].each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

# Suppliers
[
  { name: "Global Suppliers Co.", contact_info: "contact@globalsuppliers.com" },
  { name: "Fast Fashion Ltd.", contact_info: "info@fastfashion.com" },
  { name: "Gadget World", contact_info: "support@gadgetworld.com" }
].each do |supplier_data|
  Supplier.find_or_create_by!(name: supplier_data[:name]) do |supplier|
    supplier.contact_info = supplier_data[:contact_info]
  end
end

# Products
[
  { name: "Cotton T-Shirt", description: "100% Cotton, soft and durable", category: "Clothing", price: 19.99, size: "M", color: "Blue", stock_quantity: 100 },
  { name: "Leather Wallet", description: "Premium quality leather", category: "Accessories", price: 49.99, size: nil, color: "Brown", stock_quantity: 50 },
  { name: "Bluetooth Headphones", description: "Noise-canceling over-ear headphones", category: "Electronics", price: 89.99, size: nil, color: "Black", stock_quantity: 30 },
  { name: "Running Shoes", description: "Comfortable and lightweight", category: "Footwear", price: 59.99, size: "10", color: "Gray", stock_quantity: 20 }
].each do |product_data|
  category = Category.find_by(name: product_data[:category])
  Product.find_or_create_by!(name: product_data[:name]) do |product|
    product.description = product_data[:description]
    product.category = category
    product.price = product_data[:price]
    product.size = product_data[:size]
    product.color = product_data[:color]
    product.stock_quantity = product_data[:stock_quantity]
  end
end

# Sales records for testing purposes
[
  { product_name: "Cotton T-Shirt", customer_name: "Alice", quantity: 2, sale_date: DateTime.now - 1.day },
  { product_name: "Leather Wallet", customer_name: "Bob", quantity: 1, sale_date: DateTime.now - 2.days },
  { product_name: "Bluetooth Headphones", customer_name: "Charlie", quantity: 1, sale_date: DateTime.now - 3.days }
].each do |sale_data|
  product = Product.find_by(name: sale_data[:product_name])
  Sale.find_or_create_by!(product: product, customer_name: sale_data[:customer_name]) do |sale|
    sale.quantity = sale_data[:quantity]
    sale.sale_date = sale_data[:sale_date]
  end
end

category = Category.find_by(name: "Clothing")
Product.find_or_create_by!(name: "New T-Shirt", description: "Test", category: category, price: 19.99, size: "M", color: "Blue", stock_quantity: 100)
Product.find_or_create_by!(name: "New1 T-Shirt", description: "Test", category: category, price: 19.99, size: "M", color: "Blue", stock_quantity: 100)
Product.find_or_create_by!(name: "New2 T-Shirt", description: "Test", category: category, price: 19.99, size: "M", color: "Blue", stock_quantity: 100)
Product.find_or_create_by!(name: "New3 T-Shirt", description: "Test", category: category, price: 19.99, size: "M", color: "Blue", stock_quantity: 100)
product = Product.find_by(name: "New3 T-Shirt")
if product
  product.update!(price: 24.99) 
end

puts "Seeding complete!"

