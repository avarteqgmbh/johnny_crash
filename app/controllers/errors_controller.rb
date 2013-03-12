class ErrorsController < ApplicationController
  
  before_filter :authenticate, except: [:create]
  
  def index
    @errors = Error.last(100)
  end
  
  def show
    @error  = Error.find(params[:id])
    @json   = @error.parsed_payload
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
