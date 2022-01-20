require 'pg'

class Bookmark

  attr_reader :id, :title, :url 

  def initialize(id:, title:, url:)
    @title = title
    @url = url 
    @id = id 
  end 

  def self.all_bookmarks
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    result = con.exec 'SELECT * FROM bookmarks;'
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title'])
    end 
  end

  def self.add_bookmark(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    new_bookmark = con.exec_params("INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title])


    Bookmark.new(id: new_bookmark[0]['id'], url: new_bookmark[0]['url'], title: new_bookmark[0]['title'])
  end
  
end