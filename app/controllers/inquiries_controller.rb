class InquiriesController < ApplicationController
  
  def new
    @inquiry = Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.save
      InquiryMailer.notify_scribe(@inquiry).deliver
      flash[:success] = "Thanks for writing! I'll get back to you soon!"
      redirect_to root_path
    else
      render :new
    end
  end
  
end