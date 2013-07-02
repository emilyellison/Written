require 'spec_helper'

describe Inquiry do
  
  context 'inquiry creation' do
  
    it "has a valid factory" do
      build(:inquiry).should be_valid
    end
  
    it "is invalid without an email" do
      build(:inquiry, email: nil).should be_invalid
    end
  
    it "is invalid with a bad email" do
      build(:inquiry, email: 'myfakeemail.com').should be_invalid
      build(:inquiry, email: 'myfakeemail.com@me').should be_invalid
      build(:inquiry, email: '@myfakeemail').should be_invalid
    end
  
    it "is invalid without a message" do
      build(:inquiry, message: nil).should be_invalid
    end
  
    it "is valid without a reply on creation" do
      build(:inquiry).should be_valid
    end
  
  end
  
  context 'replying to an inquiry' do

    it "is invalid without a reply on update" do
      inquiry = create(:inquiry)
      inquiry.reply = nil
      inquiry.should be_invalid
    end
  
    it "is valid with a reply on update" do
      inquiry = create(:inquiry)
      inquiry.reply = 'Thanks for the email!'
      inquiry.should be_valid
    end
  
  end

  context 'scopes with three replied inquiries and two unreplied' do

    before do
      5.times do
        create(:inquiry) 
        sleep 1
      end
      Inquiry.limit(3).each { |inquiry| inquiry.update_attributes(reply: 'Thanks for the feedback!') }
    end
  
    it 'has the scope most recent which orders inquiries in descending order of creation' do
      Inquiry.most_recent.first.created_at.should be >= Inquiry.most_recent.last.created_at
    end
  
    it 'has a scope replied which returns three inquiries' do
      Inquiry.replied.count.should == 3
    end
  
    it 'has a scope need reply which returns two inquiries' do
      Inquiry.need_reply.count.should == 2
    end
  
  end
  
end