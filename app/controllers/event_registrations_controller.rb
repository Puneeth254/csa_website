class EventRegistrationsController < ApplicationController
    before_action :authenticate_user!
    def create
        params.permit(:id, :team_name, :team_members)
        reg = EventRegistrations.find_by(id: params[:id].downcase, team_name: params[:team_name].downcase)
        if reg
            flash[:alert]= "Team name already exists"
        else
            reg = EventRegistrations.new(
                event_name: Event.find_by(id: params[:id]).event_name,
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