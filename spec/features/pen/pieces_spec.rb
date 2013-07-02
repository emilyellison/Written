require 'spec_helper'

feature "pieces" do
  
  before do
    scribe = create(:scribe)
    login(scribe)
  end
  
  scenario "scribe is informed they haven't added any pieces when there are 0 pieces" do
    page.should have_content("You haven't added any pieces yet.")
  end
  
  scenario "there are no progress bars before a piece has been added" do
    page.should_not have_selector('div.progress', visible: true)    
  end
  
  scenario "there are no images before a piece has been added" do
    page.should_not have_selector('img', visible: true)    
  end
  
  scenario "uploading an invalid piece should cause the piece count to be 0" do
    upload_piece file: 'text_file.txt'
    expect(Piece.count).to eq(0)
  end
  
  scenario "uploading a piece should cause a progress bar to appear" do
    upload_piece
    page.should have_selector('div.progress', visible: true)    
  end
  
  scenario "uploading a piece should change the piece count by 1" do
    expect { upload_piece }.to change(Piece, :count).by(1)
  end
  
  scenario "uploading a piece should remove the notice that no pieces have been added" do
    upload_piece
    page.should_not have_content("You haven't added any pieces yet.")    
  end
  
  scenario "after a piece has been uploaded, the title of the file appears" do
    upload_piece
    page.has_field?('piece_title', with: 'Rails')
  end
  
  scenario "scribe can update a piece's title" do
    update_piece
    page.has_field?('piece_title', with: 'This is not a pipe.')
  end
  
  scenario "scribe can update a piece's description" do
    update_piece
    page.has_field?('piece_description', with: 'Yes it is.')
  end
  
  scenario "scribe can view all pieces" do
    5.times { create(:piece) }    
    visit pen_pieces_path
    page.should have_selector('img', count: 5)    
  end

end



