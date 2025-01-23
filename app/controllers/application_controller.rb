class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private
  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "You need to sign in before continuing."
    end
  end

  def user_signed_in?
    current_user.present?
  end
end
