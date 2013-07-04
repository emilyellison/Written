require 'spec_helper'

feature "pieces page" do
  
  before do
    5.times { create(:piece) }
    @piece = Piece.first
    visit pieces_path
  end
  
  scenario "guest should see a thumb of all pieces" do
    page.should have_selector('img.thumb', count: 5)    
  end
  
  scenario "guest should see one large piece" do
    page.should have_selector('img.large', count: 1)    
  end
  
  scenario "guest should see one large image of the first piece" do
    page.should have_selector("img.large#piece_#{@piece.id}")
  end
  
  scenario "when guest clicks next they are redirected to piece show page" do
    click_on 'next'
    expect(current_path).to eq piece_path(@piece.next)
  end
  
  scenario "when guest clicks next they are shown the next piece in large size" do
    click_on 'next'
    page.should have_selector("img.large#piece_#{@piece.next.id}")
  end
  
  scenario "there is no link to a previous image" do
    page.should_not have_selector('a', text: 'Previous')
  end

end

feature 'piece page' do
  
  before(:each) do
    5.times { create(:piece) }
    @piece = Piece.all[2]
    visit piece_path(@piece)
  end
  
  scenario "guest should see a thumb of all pieces" do
    page.should have_selector('img.thumb', count: 5)    
  end
  
  scenario "guest should see one large piece" do
    page.should have_selector('img.large', count: 1)    
  end
  
  scenario "guest should see one large image of the first piece" do
    page.should have_selector("img.large#piece_#{@piece.id}")
  end
  
  scenario "when guest clicks next they are redirected to piece show page" do
    click_on 'next'
    expect(current_path).to eq piece_path(@piece.next)
  end
  
  scenario "when guest clicks next they are shown the next piece in large size" do
    click_on 'next'
    page.should have_selector("img.large#piece_#{@piece.next.id}")
  end
  
  scenario "when guest clicks previous they are redirected to piece show page" do
    click_on 'previous'
    expect(current_path).to eq piece_path(@piece.previous)
  end
  
  scenario "when guest clicks previous they are shown the previous piece in large size" do
    click_on 'previous'
    page.should have_selector("img.large#piece_#{@piece.previous.id}")
  end
  
end