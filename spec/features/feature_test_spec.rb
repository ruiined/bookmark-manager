# frozen_string_literal: true

feature 'testing bookmark manager' do
  scenario 'lists all bookmarks' do
    Bookmarks.add('http://testing_bookmarks.com')
    visit '/bookmarks'
    expect(page).to have_content('http://testing_bookmarks.com')
  end

  scenario 'adds a bookmark' do
    visit '/bookmarks'
    click_button('Add Bookmark')
    expect(page).to have_content('Add Bookmark')
  end

  scenario 'adds a bookmark' do
    visit '/bookmarks'
    click_button('Add Bookmark')
    fill_in(name: 'url', with: 'http://pileofsite.com')
    click_button('Submit')
    expect(page).to have_content('http://pileofsite.com')
  end
end
