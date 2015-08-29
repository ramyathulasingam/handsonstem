class LoginController < ApplicationController
  def login
    if session[:eventbrite_auth_token]
      @current_user = User.find_by_eventbriteAuthToken(session[:eventbrite_auth_token])
      redirect_to :controller => "workshops", :action => "index"
    else 
      redirect_to('/auth/eventbrite')
    end
  end
end