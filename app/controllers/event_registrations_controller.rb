class EventRegistrationsController < ApplicationController
    before_action :authenticate_user!
    def create
        params.permit(:id, :team_name, :team_members)
        arr = params[:team_members].split("|")
        event = Event.find_by(id: params[:id])
        unless arr.length == event.team_size
            flash[:alert]= "Team size doesn't match the requirement"
            redirect_to events_path and return
        end
        reg = EventRegistrations.find_by(id: params[:id].downcase, team_name: params[:team_name].downcase)
        if reg
            flash[:alert]= "Team name has already been taken"
        else
            reg = EventRegistrations.new(
                event_name: event.event_name,
                team_name: params[:team_name].downcase,
                players: params[:team_members].downcase
            )
            if reg.save
                flash[:notice]= "Registered successfully"
            else
                flash[:alert]= "Error while saving"
            end
        end
        redirect_to events_path
    end
end