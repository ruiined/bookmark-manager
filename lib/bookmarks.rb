require 'pg'

class Bookmarks
  
  def self.all
    self.extract_urls
  end

  private

  def self.extract_urls
    self.pg_records.map do |record|
      record["url"]
    end
  end

  def self.pg_records
    self.connect_to_pg.exec( "SELECT * FROM bookmarks") 
  end

  def self.connect_to_pg
    PG.connect(dbname: "bookmark_manager")
  end
end