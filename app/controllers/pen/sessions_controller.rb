class Pen::SessionsController < Pen::ApplicationController
  
  skip_before_filter :require_scribe!
  
  def new
  end

  def create
    scribe = Scribe.find_by_email params[:email]
    if scribe && scribe.authenticate(params[:password])
      sign_in scribe
      redirect_to pen_root_path, notice: "Logged in!"
    else
      flash.now.alert = "Invalid login credentials."
      render :new
    end
  end

  def destroy
    session[:scribe_id] = nil
    flash[:notice] = "Logged out."
    redirect_to root_path
  end
  
end