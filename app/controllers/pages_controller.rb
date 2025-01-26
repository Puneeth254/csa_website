class PagesController < ApplicationController
    before_action :authenticate_user!, only: :profile

    def home
        
    end

    def profile

    end
end