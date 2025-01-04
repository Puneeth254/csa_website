class MerchController < ApplicationController
  def index
    @categories = Category.all
    @suppliers = Supplier.all
    @products = Product.includes(:category).all
    @sales = Sale.includes(:product).all
  end
end
