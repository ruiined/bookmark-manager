# frozen_string_literal: true

require 'pg'

# Bookmarks
class Bookmarks
  class << self
    def all
      connect_to_database
      request
      process_response
    end

    private

    def process_response
      @response.map do |record|
        record['url']
      end
    end

    def request
      @response = @connection.exec('SELECT * FROM bookmarks')
    end

    def connect_to_database
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end
