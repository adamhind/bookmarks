describe "looks at the index.erb and view the content", type: :feature do 
  it 'allow the user to go on the index page' do 
    visit('/')
    expect(page).to have_content "Here are your bookmarks" 
  end 
end

# describe "viewing bookmarks", type: :feature do
#   it 'allows the user to see their bookmarks' do
#     visit('/bookmarks')
#     expect(page).to have_content "www.google.com"
#   end
# end