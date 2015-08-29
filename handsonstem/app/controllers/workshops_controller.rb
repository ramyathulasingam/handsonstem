class WorkshopsController < ApplicationController
  def new
    @workshop = Workshop.new
  end
  
  def create
    
  end
  
  # GET /workshops/:id
  def show
    @workshop = Workshop.find(params[:id])
  end
end
