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

  def purchase
    @suppliers = Supplier.all
    @products = Product.all
    @sales = Sale.includes(:product).all

    @order = Sale.new(purchase_params)

    if @order.save
      redirect_to merch_path, notice: 'Merch was successfully purchased.'
    else
      render :index
    end

  end


  def export_sales
    @sales = Sale.all
    respond_to do |format|
      format.xlsx { render xlsx: "export_sales", filename: "sales_data.xlsx" }
    end
  end
  

  private

  def purchase_params
    params.permit(:product_name, :student_name, :roll_number, :size)
  end

  def product_params
    params.permit(:name, :price, :description, :image)
  end

end
