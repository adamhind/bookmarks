
def truncate_db
  con = PG.connect(dbname: 'bookmark_manager_test')
  result = con.exec 'TRUNCATE TABLE bookmarks;'
end

def add_test_entry
  con = PG.connect(dbname: 'bookmark_manager_test')
  result = con.exec "INSERT INTO bookmarks (url, title) VALUES('https://www.google.com', 'Test');"
end

