feature "Adding a new bookmark" do

  scenario "Before bookmark is added" do
    visit('/')
    click_button('Add Bookmark')
    expect(page).to have_content 'Enter your url'
  end

  scenario "After bookmark is added" do
    visit('/')
    click_button('Add Bookmark')
    fill_in 'url', with: 'http://www.google.com'
    fill_in 'title', with: 'Test'
    click_button('Submit')
    expect(page).to have_link('Test', href: 'http://www.google.com')
  end
end
