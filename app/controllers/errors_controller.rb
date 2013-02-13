class ErrorsController < ApplicationController
  
  before_filter :authenticate, except: [:create]
  
  def index
    @errors = Error.all
  end
  
  def show
    @error = Error.find(params[:id])
  end
  
  def create
    Error.create(payload: params.to_json)
    render :nothing => true
  end
  
  def update
  end
end
