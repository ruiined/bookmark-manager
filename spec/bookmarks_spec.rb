# frozen_string_literal: true

require 'bookmarks'

describe Bookmarks do
  subject(:bookmarks) { described_class.all(bookmark_class) }
  let(:title) { "Testing Bookmarks" }
  let(:url) { 'http://testing_bookmarks.com' }
  let(:bookmark_class) { double :bookmark_class, new: bookmark }
  let(:bookmark) { double :bookmark, title: title, url: url}
  
  describe '.all' do
    it 'returns an array of bookmarks' do
      expect(bookmarks).to be_an_instance_of(Array)
    end
  end
  describe '.add' do
    it 'adds to the test database' do
      described_class.add(bookmark)
      expect(bookmarks).to eq [bookmark]
    end
  end
end
