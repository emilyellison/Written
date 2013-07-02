require 'spec_helper'

describe Scribe do
  
  it "has a valid factory" do
    create(:scribe).should be_valid
  end
  
  it "is invalid without a first name" do
    build(:scribe, first_name: nil).should be_invalid
  end

  it "is invalid without a last name" do
    build(:scribe, last_name: nil).should be_invalid
  end
  
  it "is invalid without an email" do
    build(:scribe, email: nil).should be_invalid
  end
  
  it "is invalid without a password" do
    build(:scribe, password: nil).should be_invalid
  end
  
  it "is invalid without a password confirmation" do
    build(:scribe, password: 'fake', password_confirmation: nil).should be_invalid
  end
  
  it "is invalid if password does not match confirmation" do
    build(:scribe, password: 'fake', password_confirmation: 'pass').should be_invalid
  end

  it "is invalid with a bad email" do
    build(:scribe, email: 'myfakeemail.com').should be_invalid
    build(:scribe, email: 'myfakeemail.com@me').should be_invalid
    build(:scribe, email: '@myfakeemail').should be_invalid
  end
  
  it "is invalid with a duplicate email" do
    create(:scribe, email: 'myfakeemail@gmail.com')
    build(:scribe, email: 'myfakeemail@gmail.com').should be_invalid
  end
  
  it "should have name equal to first and last name" do
    user = create(:scribe, first_name: 'Emily', last_name: 'Ellison')
    expect(user.name).to eq('Emily Ellison')
  end
  
  it "transforms emails to lowercase before saving" do
    user = create(:scribe, email: 'MYFAKEEMAIL@GMAIL.COM')
    expect(user.email).to eq('myfakeemail@gmail.com')
  end
  
end
