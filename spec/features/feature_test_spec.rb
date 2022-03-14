feature "testing bookmark manager" do
  scenario  "lists all bookmarks" do
    visit '/bookmarks'
    expect(page).to have_content("Bookmark")
  end
end