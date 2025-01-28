class MerchController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @products = Merch.all
    end

    def create
        params.permit(:name, :price, :description, :image_url, :customized)
        Merch.create(
            name: params[:name],
            price: params[:price],
            description: params[:description],
            url_of_image: params[:image_url],
            is_customized: params[:customized]
        )
        redirect_to merch_index_path, notice: "Merch added successfully"
    end
end