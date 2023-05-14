require_relative 'book'




class BookRepository
  def all
    my_query = 'SELECT id, title, author_name FROM books;'
    result_set = DatabaseConnection.exec_params(my_query, [])
    #the database connection method? connects to the database and runs the inserted string as an SQL query through psql

    b = [] #an initially empty array that should later contain all our data
    
    result_set.each do |result|
      #result_set gives an array of hashes, so for each book i.e. HASH in the result set 
      #we want to create a new object in the artist model class i.e INFLATING the object
      #and then we assign what the different properties of that object to the different values in the HASH
      book = Book.new
      book.id = result['id']
      book.title = result['title']
      book.author_name = result['author_name']
      
      b << book
      #although the value of the 'artist' will always be replaced by the next,
      #this is fine because the memory about this only needs to be held until the artists empty array is populated
    end

    return b #"#{book.id} - #{book.title} - #{book.author_name} "
  end
end