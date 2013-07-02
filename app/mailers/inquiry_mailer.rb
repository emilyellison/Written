class InquiryMailer < ActionMailer::Base
  add_template_helper ApplicationHelper 
  default from: "no-reply@fixitwithcode.com"
  
  def notify_scribe inquiry
    @inquiry = inquiry
    mail(to: 'emily@fixitwithcode.com', subject: "You've received an inquiry at Writ")
  end
  
  def reply_to inquiry
    @inquiry = inquiry
    mail(to: @inquiry.email, subject: 'RE: Your message to Writ')
  end
  
end
