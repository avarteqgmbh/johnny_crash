class ApplicationController < ActionController::Base
  protect_from_forgery
  add_breadcrumb :index, :root_path
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      AUTHENTICATION["users"][username].eql?(password)
    end
  end
end
