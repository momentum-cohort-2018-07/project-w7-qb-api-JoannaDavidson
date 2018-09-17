class SessionsController < ApplicationController
  skip_before_action :verify_authentication

    
  def create
    whiner = Whiner.find_by_username(params[:username].downcase)
    if whiner && whiner.authenticate(params[:password])
      session[:whiner_id] = whiner.id
      redirect_to root_path
    else
      flash[:error_message] = " Please try again!"
      redirect_to new_session_path
    end
  end
  
  def destroy
    session[:whiner_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end

end