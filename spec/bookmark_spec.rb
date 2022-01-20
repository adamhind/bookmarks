require 'bookmarks'

describe Bookmark do
  describe '.all_bookmarks' do
    it 'returns all bookmarks' do
     
      bookmark = Bookmark.add_bookmark(url: "http://www.google.com", title: "Test_google")
      Bookmark.add_bookmark(url: "http://www.hello.com", title: "Test_hello")
      Bookmark.add_bookmark(url: "http://www.twitter.com", title: "Test_twitter")

      bookmarks = Bookmark.all_bookmarks

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks[0].title).to eq 'Test_google'
      expect(bookmarks.first.url).to eq 'http://www.google.com'

    end
  end

  describe "#add_bookmark" do
    it "adds a bookmark to the database" do
      bookmark = Bookmark.add_bookmark(url: 'www.twitter.com', title: 'Test') 
      expect(bookmark.url).to eq("www.twitter.com")
      expect(bookmark.title).to eq("Test")
    end
  end
end
