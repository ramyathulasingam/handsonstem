class UsersController < ApplicationController

  
  def new
  end

  def show
  end

  def create
    if @current_user == nil && session[:eventbrite_auth_token] != nil
      @current_user = User.new
      @current_user.eventbriteAuthToken = session[:eventbrite_auth_token]
      @current_user.save
      
      @conn = Faraday.new(:url => 'http://www.eventbriteapi.com') do |faraday|
        faraday.use FaradayMiddleware::FollowRedirects
        faraday.headers['Accept'] = 'application/json'
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  :net_http  # make requests with Net::HTTP
      end
      
      response = @conn.get '/v3/users/me/?token=' + session[:eventbrite_auth_token] + ''
      puts "CREATE USER: "
      resp = JSON.parse(response.body)
      @current_user.name = resp["name"]
      puts response.body
      redirect_to :controller => "workshops", :action => "index"
    else
      return
    end
  end
end
