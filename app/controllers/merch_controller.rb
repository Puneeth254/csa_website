class MerchController < ApplicationController
  def index
    @categories = Category.all
    @suppliers = Supplier.all
    @products = Product.includes(:category).all
    @sales = Sale.includes(:product).all
  end

  def create
    @product = Product.new(product_params)
    @category = Category.find_by(name: params[:product][:category])
    @product.category = @category if @category
  
    if @product.save
      redirect_to products_path, notice: 'Product was successfully created.'
    else
      render :index
    end
  end
  

  private

  def product_params
    params.require(:product).permit(:name, :description, :category, :price, :size, :color, :stock_quantity)
  end

end
