require 'spec_helper'

describe Gallery do
  
  it "has a valid factory" do
    build(:gallery).should be_valid
  end
  
  it "is invalid without a name" do
    build(:gallery, name: nil).should be_invalid
  end
  
end
