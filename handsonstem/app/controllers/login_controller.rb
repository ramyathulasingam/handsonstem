class LoginController < ApplicationController
  
  def login
    if session[:eventbrite_auth_token]
      @current_user = User.find_by_eventbrite_auth_token(session[:eventbrite_auth_token])
    else 
      redirect_to('/auth/eventbrite')
  end

end
