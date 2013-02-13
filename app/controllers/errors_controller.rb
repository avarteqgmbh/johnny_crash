class ErrorsController < ApplicationController
  
  before_filter :authenticate, except: [:create]
  
  def index
    @errors = Error.all
  end
  
  def show
    @error  = Error.find(params[:id])
    @json   = JSON.parse(@error.payload)
  end
  
  def create
    params.delete("action")
    params.delete("controller")
    Error.create(payload: params.to_json)
    render :nothing => true
  end
  
  def update
  end
  
  def destroy
    @error = Error.find(params[:id])
    @error.destroy
    flash[:notice] = "Error successfully deleted."
    redirect_to errors_path
  end
end
