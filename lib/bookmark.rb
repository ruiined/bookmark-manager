# frozen_string_literal: true

# here is our bookmark class, enjoy
class Bookmark
  attr_reader :title, :url

  def initialize(url, title)
    @url = url
    @title = title
  end
end
