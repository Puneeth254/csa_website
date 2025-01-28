class EventsController < ApplicationController
    before_action :authenticate_user!
    
    def home
        
    end

    def index
        @upcoming_events = Event.where(event_type: 1)
        @ongoing_events = Event.where(event_type: 2)
        @completed_events = Event.where(event_type: 3)
    end

    def create
        params.permit(:event_name, :team_size)
        event = Event.new(
            event_name: params[:event_name],
            team_size: params[:team_size],
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

    def start
        params.permit(:id)
        Event.find_by(id: params[:id])&.update(event_type: 2)
        redirect_to events_path, notice: 'Event started successfully'
    end

    def end
        params.permit(:id)
        Event.find_by(id: params[:id])&.update(event_type: 3)
        redirect_to events_path, notice: 'Event completed successfully'
    end

    def destroy
        params.permit(:id)
        event = Event.find_by(id: params[:id])
        event_name = event.event_name.to_s
        event.destroy
        EventRegistrations.where(event_name: event_name).destroy_all
        redirect_to events_path, notice: 'Event deleted successfully'
    end
end