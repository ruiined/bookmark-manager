# frozen_string_literal: true

require 'pg'

class Bookmarks
  def self.all
    extract_urls
  end

  def self.extract_urls
    pg_records.map do |record|
      record['url']
    end
  end

  def self.pg_records
    connect_to_pg.exec('SELECT * FROM bookmarks')
  end

  def self.connect_to_pg
    PG.connect(dbname: 'bookmark_manager')
  end
end
