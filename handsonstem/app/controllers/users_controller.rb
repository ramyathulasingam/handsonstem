class UsersController < ApplicationController

  
  def new
  end

  def show
    @current_user = User.find_by_id(session[:current_user_id]) # Use find_by_id to get nil instead of an error if user doesn't
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
      @current_user.save
      puts response.body
      
      session[:current_user_id] = @current_user.id
      puts @current_user
      
      redirect_to :controller => "workshops", :action => "index"
    else
      return
    end
  end
end
