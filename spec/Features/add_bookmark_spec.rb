feature "Adding a new bookmark" do

  scenario "Before bookmark is added" do
    visit('/')
    click_button('Add Bookmark')
    expect(page).to have_content 'Enter your url'
  end

  scenario "After bookmark is added" do
    visit('/')
    click_button('Add Bookmark')
    fill_in 'url', with: 'fake_web_page'
    click_button('Submit')
    expect(page).to have_content 'fake_web_page'
  end
end
