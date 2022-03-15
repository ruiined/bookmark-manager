# frozen_string_literal: true

require 'pg'

# Bookmarks
class Bookmarks
  class << self
    def all
      connect_to_database
      command('SELECT * FROM bookmarks')
      process_response
    end

    def add(url)
      connect_to_database
      command("INSERT INTO bookmarks (url) VALUES ('#{url}')")
    end

    private

    def process_response
      @response.map do |record|
        record['url']
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
