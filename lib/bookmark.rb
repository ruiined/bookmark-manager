class Bookmark
  attr_reader :title, :url
  
  def initialize(title, url)
    @title, @url = [title, url]
  end
end