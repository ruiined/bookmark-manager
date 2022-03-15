require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new(title, url) }
  let(:title) { "Pile of Site" }
  let(:url) { "http://pileof.site" }
  
  it "stores a title" do
    expect(bookmark.title).to eq title
  end
  it "store a url" do
    expect(bookmark.url).to eq url
  end
end