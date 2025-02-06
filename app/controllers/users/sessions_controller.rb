# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :remember_me])
    params.require(:user).permit(:username, :password)
    user = User.find_by(username: params[:user][:username].downcase)
    if user
      if user.valid_password?(params[:user][:password])
        sign_in user
        redirect_to root_path
      else
        flash[:alert] = 'Invalid password please try again!'
        redirect_to new_user_session_path
      end
    else
      flash[:alert] = 'Invalid username'
      redirect_to new_user_session_path
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
end
