
require_relative 'album' #need to require the model class so the method defined below makes sense
#require 'database_connection' 


class AlbumRepository
  def all
    my_query = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(my_query, [])
    #the database connection method? connects to the database and runs the inserted string as an SQL query through psql

    albums = [] #an initially empty array that should later contain all our data
    
    result_set.each do |record|
      #result_set gives an array of hashes, so for each record i.e. HASH in the result set 
      #we want to create a new object in the album model class i.e INFLATING the object
      #and then we assign what the different properties of that object to the different values in the HASH
      album = Album.new
      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']
      
      albums << album
      #although the value of the 'album' will always be replaced by the next,
      #this is fine because the memory about this only needs to be held until the albums empty array is populated
    end

    return albums
  end
end

