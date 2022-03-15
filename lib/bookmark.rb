class Bookmark
  attr_reader :title, :url

  def initialize(url, title)
    @url, @title = [url, title]
  end
end