feature 'Deleting a bookmark using a button' do 
  scenario 'click a button next to the link to delete it' do 
    
    Bookmark.add_bookmark(url: 'www.delete.com', title: 'Delete_test')

    visit('/bookmarks')
    
    expect(page).to have_link('Delete_test', href: 'www.delete.com')

    first('.bookmark').click_button "Delete"

    expect(current_path).to eq '/bookmarks'
    expect(page).to_not have_link('Delete_test', href: 'www.delete.com')
  end
end 