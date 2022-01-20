require 'sinatra/base'
require_relative 'lib/bookmarks'

class Bookmarks < Sinatra::Base
  
  get '/' do 
    redirect '/bookmarks'
  end 

  get '/bookmarks' do
   @bookmarks = Bookmark.all_bookmarks
   erb :'bookmarks/index'
  end

  get '/add' do
    erb :'bookmarks/add'
  end

  post '/save-bookmark' do
    Bookmark.add_bookmark(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  enable :sessions, :method_override

  delete '/bookmarks/:id' do 
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end 

  run! if app_file == $0

end

