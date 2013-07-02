require 'spec_helper'

describe Piece do
  
  it "has a valid factory" do
    create(:piece).should be_valid
  end
    
end
