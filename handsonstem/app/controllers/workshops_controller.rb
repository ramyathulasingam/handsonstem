class WorkshopsController < ApplicationController
  def new
    @workshop = Workshop.new
  end
  
  def create
    
  end

  def index
    @events = Workshop.get_events
    puts "CURRENT USER: "
    puts User.find_by_id(session[:current_user_id]).inspect
    @current_user = User.find_by_id(session[:current_user_id]) # Use find_by_id to get nil instead of an error if user doesn't
    @import_event = Workshop.new
    @import_event.save
  end

  def get_data
    @events = Workshop.get_events
    render json: @events
  end
  
  # GET /workshops/:id
  def show
    @workshop = Workshop.find(params[:id])
  end
  
  def import
    puts "PARAMS:"
    puts params
    
    @conn = Faraday.new(:url => 'http://www.eventbriteapi.com/') do |faraday|
      faraday.use FaradayMiddleware::FollowRedirects
      faraday.headers['Accept'] = 'application/json'
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  :net_http  # make requests with Net::HTTP
    end
    
    response = @conn.get '/v3/users/me/events?token=' + session[:eventbrite_auth_token] + ''
    puts "EVENTS: "
    resp = JSON.parse(response.body)
    event = resp["events"][0]
    puts "EVENT"
    puts event
    
  end
  
  def callback
    puts request.body.read
  end
end
