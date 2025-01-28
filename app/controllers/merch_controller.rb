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

  def export_sales
    @suppliers = Supplier.all
    @products = Product.all

    @sales = Sale.all
    respond_to do |format|
      format.xlsx { render xlsx: "export_sales", filename: "sales_data.xlsx" }
    end
  end

  def destroy
    @suppliers = Supplier.all
    @products = Product.all
    @sales = Sale.includes(:product).all

    @product = Product.find_by(name: params[:product_name])

    @product&.destroy
    redirect_to merch_path, notice: "Product deleted successfully."
  end
  

  private

  def purchase_params
    params.permit(:product_name, :student_name, :roll_number, :size)
  end

  def product_params
    params.permit(:name, :price, :description, :image)
  end

end
