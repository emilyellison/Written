require "spec_helper"

describe InquiryMailer do
  
  describe "notify scribe" do
    
    let(:inquiry) { create(:inquiry) }
    let(:mail) { InquiryMailer.notify_scribe(inquiry) }

    it "has the correct subject" do
      mail.subject.should eq("You've received an inquiry at Writ")
    end
    
    it "sends to emily@fixitwithcode.com" do
      mail.to.should eq(['emily@fixitwithcode.com'])
    end
    
    it "comes from no-reply@fixitwithcode.com" do
      mail.from.should eq(["no-reply@fixitwithcode.com"])
    end
    
  end
  
  describe "reply to inquiry" do
    
    let(:inquiry) { create(:reply) }
    let(:mail) { InquiryMailer.reply_to(inquiry) }

    it "has the correct subject" do
      mail.subject.should eq("RE: Your message to Writ")
    end
    
    it "sends to emily@fixitwithcode.com" do
      mail.to.should eq([inquiry.email])
    end
    
    it "comes from no-reply@fixitwithcode.com" do
      mail.from.should eq(["no-reply@fixitwithcode.com"])
    end

  end

end
