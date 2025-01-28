class PagesController < ApplicationController
    before_action :authenticate_user!, only: :profile

    def home
        
    end

    def profile
        @events_registered = EventRegistrations.where("event_registrations.players LIKE ?", "%#{current_user.username}%")
        @merch_purchased = Sale.where(ordered_by: current_user.username)
    end
end