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
# ["Clothing", "Accessories", "Electronics", "Footwear"].each do |category_name|
#   Category.find_or_create_by!(name: category_name)
# end

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
  { name: "Cotton T-Shirt", description: "100% Cotton, soft and durable", price: 19.99, image: "tshirt.jpg"},
  { name: "Leather Wallet", description: "Premium quality leather", price: 49.99, image: "tshirt.jpg"},
  { name: "Bluetooth Headphones", description: "Noise-canceling over-ear headphones", price: 89.99, image: "tshirt.jpg"},
  { name: "Running Shoes", description: "Comfortable and lightweight", price: 59.99, image: "tshirt.jpg"}
].each do |product_data|
  Product.find_or_create_by!(name: product_data[:name]) do |product|
    product.description = product_data[:description]
    product.price = product_data[:price]
    product.image = "/merch/#{product_data[:image]}"
  end
end

# Sales records for testing purposes
[
  { product_name: "Cotton T-Shirt", student_name: "Alice", roll_number: "CS23B001", size: "S" },
  { product_name: "Leather Wallet", student_name: "Bob", roll_number: "CS23B001", size: "S" },
  { product_name: "Bluetooth Headphones", student_name: "Charlie", roll_number: "CS23B001", size: "S" }
].each do |sale_data|
  product = Product.find_by(name: sale_data[:product_name])

  if product
    Sale.find_or_create_by!(product: product) do |sale|
      sale.student_name = sale_data[:student_name]
      sale.size = sale_data[:size]
      sale.roll_number = sale_data[:roll_number]
      sale.product_name = sale_data[:product_name]
    end
  else
    puts "Warning: Product '#{sale_data[:product_name]}' not found!"
  end
end



# category = Category.find_by(name: "Clothing")
# Product.find_or_create_by!(name: "New T-Shirt", description: "Test", category: category, price: 19.99, size: "M", color: "Blue", stock_quantity: 100)
# Product.find_or_create_by!(name: "New1 T-Shirt", description: "Test", category: category, price: 19.99, size: "M", color: "Blue", stock_quantity: 100)
# Product.find_or_create_by!(name: "New2 T-Shirt", description: "Test", category: category, price: 19.99, size: "M", color: "Blue", stock_quantity: 100)
# Product.find_or_create_by!(name: "New3 T-Shirt", description: "Test", category: category, price: 19.99, size: "M", color: "Blue", stock_quantity: 100)
# product = Product.find_by(name: "New3 T-Shirt")
# if product
#   product.update!(price: 24.99) 
# end

puts "Seeding complete!"

