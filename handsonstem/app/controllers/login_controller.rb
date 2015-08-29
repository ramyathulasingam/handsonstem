class LoginController < ApplicationController
  def login
    if session[:eventbrite_auth_token]
      @current_user = User.find_by_eventbriteAuthToken(session[:eventbrite_auth_token])
      if @current_user == nil
        redirect_to('/auth/eventbrite')
      else
        puts @current_user
        session[:current_user_id] = @current_user[:id]
        redirect_to :controller => "workshops", :action => "index"
      end
    else 
      redirect_to('/auth/eventbrite')
    end
  end
end