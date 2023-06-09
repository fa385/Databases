# file: app.rb

require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, title, author_name FROM books;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
result.each do |book|
  #p record["id"].to_i
  puts "#{book["id"]} - #{book["title"]} - #{book["author_name"]}"
  
end