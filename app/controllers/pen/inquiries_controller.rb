class Pen::InquiriesController < Pen::ApplicationController
  
  def index
    @inquiries = Inquiry.most_recent.page(params[:page]).per(5)
  end
  
  def update
    @inquiries = Inquiry.most_recent.page(params[:page]).per(5)
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.update_attributes(params[:inquiry])
      InquiryMailer.reply_to(@inquiry).deliver
    end
  end
  
end