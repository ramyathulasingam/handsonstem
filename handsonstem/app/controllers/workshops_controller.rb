class WorkshopsController < ApplicationController

  def new
    @workshop = Workshop.new
  end
  
  def create
    
  end

  def index
    events = Workshop.get_events
  end
  
  # GET /workshops/:id
  def show
    @workshop = Workshop.find(params[:id])
  end
  
  def callback
    puts request.body.read
  end
end
