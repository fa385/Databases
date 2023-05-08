require_relative '../lib/database_connection'
require_relative '../lib/artist_repository'

DatabaseConnection.connect('music_library') #use the name of the database for the project
#calling a special kind of method, a class method
# got back to 9;36 of the video https://www.youtube.com/watch?v=9pwchQJwc5Q&ab_channel=LeoHetsch

#result = DatabaseConnection.exec_params('SELECT * FROM albums;', [])
#FIRST ARGUMENT SENDS THE SQL AS A STRING THEN SENDS IT BACK TO OUR PROGRAMME
#PG GEM CONVERTS THE DATASETS FROM THE TABLE FROM OF SQL INTO AN ARRAY OF HASHES
#p result READ THE PG GEM DOCUMENTATION TO UNDERSTAND THIS
#p is for print!

artist_repository = ArtistRepository.new

p artist_repository.all