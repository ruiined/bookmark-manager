require 'bookmarks'

describe Bookmarks do
  describe ".all" do
    it "returns an array of bookmarks" do
      expect(described_class.all).to be_an_instance_of(Array)
    end

    # it "returns url from bookmarks" do
    #   expect(described_class.all).to output (link).to_stdout
    # end
  end
end