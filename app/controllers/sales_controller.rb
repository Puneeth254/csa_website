class SalesController < ApplicationController
  before_action :authenticate_user!

  def create
    # Find the product based on the name
    product = Product.find_by(name: params[:product_name])

    # Check if the product exists
    if product.nil?
      redirect_to merch_path, alert: 'Product not found.'
      return
    end

    # Create a new sale with the found product's ID
    @sale = Sale.new(sale_params)
    @sale.product = product

    if @sale.save
      redirect_to merch_path, notice: 'Sale was successfully recorded.'
    else
      render :index
    end
  end

  private

  def sale_params
    params.permit(:student_name, :roll_number, :size)
  end
end
