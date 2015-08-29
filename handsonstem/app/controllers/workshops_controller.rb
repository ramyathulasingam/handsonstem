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
  end

  def get_data
    @events = Workshop.get_events
    render json: @events
  end
  
  # GET /workshops/:id
  def show
    @workshop = Workshop.find(params[:id])
  end
  
  def callback
    puts request.body.read
  end
end
