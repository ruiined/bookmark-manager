# frozen_string_literal: true

require 'pg'
require_relative 'bookmark'

# Bookmarks
class Bookmarks
  class << self
    def all(bookmark_class = Bookmark)
      connect_to_database
      command('SELECT * FROM bookmarks')
      process_response(bookmark_class)
    end

    def add(bookmark)
      connect_to_database
      command("INSERT INTO bookmarks (url, title) VALUES ('#{bookmark.url}', '#{bookmark.title}')")
    end

    private

    def process_response(bookmark_class)
      @response.map do |record|
        bookmark_class.new(record['url'], record['title'])
      end
    end

    def command(command)
      @response = @connection.exec(command)
    end

    def connect_to_database
      @connection = PG.connect(dbname: database_environment)
    end

    def database_environment
      ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    end
  end
end
