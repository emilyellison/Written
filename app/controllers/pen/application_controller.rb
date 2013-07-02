class Pen::ApplicationController < ApplicationController
  
  layout 'pen'
  
  before_filter :require_scribe!
  
  def sign_in scribe
    session[:scribe_id] = scribe.id
  end
  
  def current_scribe
    @current_scribe ||= Scribe.find(session[:scribe_id]) unless session[:scribe_id].nil?
  end
  helper_method :current_scribe
  
  private
    
    def require_scribe!
      reset_session unless session[:last_page_load].present? && session[:last_page_load] > 1.day.ago
      redirect_to pen_login_path, alert: "Please login to proceed." if current_scribe.nil?
    end
  
end