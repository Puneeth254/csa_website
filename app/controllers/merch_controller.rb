class MerchController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @products = Merch.where(name: "usa")
    end
end