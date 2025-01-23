class MerchController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @suppliers = Supplier.all
    @products = Product.all
    @sales = Sale.includes(:product).all
  end

  def create
    @suppliers = Supplier.all
    @products = Product.all
    @sales = Sale.includes(:product).all

    @product = Product.new(product_params)
  
    if @product.save
      redirect_to merch_path, notice: 'Merch was successfully added.'
    else
      render :index
    end
  end
  

  private

  def product_params
    params.permit(:name, :price, :description)
  end

end
