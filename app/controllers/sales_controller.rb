class SalesController < ApplicationController
    before_action :authenticate_user!
    def create
        params.permit(:product_name, :customization_name, :size)
        Sale.create(
            merch_name: params[:product_name],
            name_to_be_customised: params[:customization_name],
            size: params[:size],
            ordered_by: current_user.username
        )
        redirect_to merch_index_path, notice: "#{params[:product_name]} purchase successfull"
    end
end