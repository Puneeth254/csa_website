class EventsController < ApplicationController
    before_action :authenticate_user!
    
    def home
        
    end

    def index
        @upcoming_events = Event.where(event_type: 1)
        @current_events = Event.where(event_type: 2)
        @completed_events = Event.where(event_type: 3)
    end

    def create
        byebug
        params.permit(:event_name)
        event = Event.new(
            event_name: params[:event_name],
            event_type: 1
        )
        unless event.save
            flash[:alert] = "Event with the same name already exists"
            redirect_to events_path
            return
        end
        flash[:notice] = "Event #{event.event_name} created successfully"
        redirect_to events_path
    end
end