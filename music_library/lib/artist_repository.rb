#need to require the model class so the method defined below makes sense
require 'artist'
require 'database_connection'


class ArtistRepository
  def all
    my_query = 'SELECT id, name, genre FROM artists;'
    result_set = DatabaseConnection.exec_params(my_query, [])
    #the database connection method? connects to the database and runs the inserted string as an SQL query through psql

    artists = [] #an empty array that should contain all our data
    
    result_set.each do |record|
      #result_set gives an array of hashes, so for each record i.e. HASH in the result set 
      #we want to create a new object in the artist model class i.e INFLATING the object
      #and then we assign what the different properties of that object to the different values in the HASH
      artist = Artist.new
      artist.id = record['id']
      artist.name = record['name']
      artist.genre = record['genre']
      
      artists << artist
      #although the value of the 'artist' will always be replaced by the next,
      #this is fine because the memory about this only needs to be held until the artists empty array is populated
    end

    return artists
  end
end