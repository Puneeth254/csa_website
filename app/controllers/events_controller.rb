class EventsController < ApplicationController
    before_action :authenticate_user!
    
    def home
        
    end

    def index

    end

    def create
        byebug
        params.permit(:event_name)
        event = Event.new(event_name: params[:event_name])
        unless event.save
            flash[:alert] = "Event with the same name already exists"
        end
        redirect_to events_path
    end
end