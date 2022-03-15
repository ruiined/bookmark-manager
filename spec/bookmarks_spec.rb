# frozen_string_literal: true

require 'bookmarks'

describe Bookmarks do
  let(:link) { 'http://testing_bookmarks.com' }

  describe '.all' do
    it 'returns an array of bookmarks' do
      expect(described_class.all).to be_an_instance_of(Array)
    end
  end
  describe '.add' do
    it 'adds to the test database' do
      described_class.add(link)
      expect(described_class.all).to include link
    end
  end
end
