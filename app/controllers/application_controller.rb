class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :last_page_load
  
  def last_page_load
    session[:last_page_load] = Time.now
  end
  
end
