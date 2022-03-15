# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'

# Bookmark Manager
class BookmarkManager < Sinatra::Base
  configure :development do
    # :nocov:
    register Sinatra::Reloader
    # :nocov:
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  get '/add_bookmark_form' do
    erb :add_bookmark
  end

  post '/add_bookmark' do
    Bookmarks.add(params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
