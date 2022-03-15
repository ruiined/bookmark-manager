# frozen_string_literal: true

require 'pg'

def truncate_test_database
  PG.connect(dbname: 'bookmark_manager_test').exec('TRUNCATE bookmarks;')
end
