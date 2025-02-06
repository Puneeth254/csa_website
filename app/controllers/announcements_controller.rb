class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all.order(created_at: :desc)
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      redirect_to root_path, notice: "Announcement added successfully."
    else
      render :index
    end
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    redirect_to root_path, notice: "Announcement deleted successfully."
  end

  private

  def announcement_params
    params.require(:announcement).permit(:content)
  end
end
