require 'spec_helper'

describe Inquiry do
  
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