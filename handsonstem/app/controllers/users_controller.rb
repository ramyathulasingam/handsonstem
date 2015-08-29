class UsersController < ApplicationController
  @conn = Faraday.new(:url => 'http://www.eventbriteapi.com/v3') do |faraday|
    faraday.request  :url_encoded             # form-encode POST params
    faraday.response :logger                  # log requests to STDOUT
    faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
  end
  
  def new
  end

  def show
  end

  def create
    if @current_user == nil && session[:eventbrite_auth_token] != nil
      @current_user = User.new
      @current_user.eventbriteAuthToken = session[:eventbrite_auth_token]
      @current_user.save
      response = @conn.get '/users/me/?token=' + session[:eventbrite_auth_token] + ''
      puts "CREATE USER: "
      puts response
    else
      return
    end
  end
end
