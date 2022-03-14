feature "testing bookmark manager" do
  scenario  "lists all bookmarks" do
    visit '/bookmarks'
    expect(page).to have_content("http://www.makersacademy.com")
  end
end