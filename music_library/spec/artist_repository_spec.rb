require 'artist_repository'
#require is used to slect what ruby file the rspec should us
# i.e. run the tests on, and should be in quotation msrks

RSpec.describe ArtistRepository do
  
  def reset_artists_table #reads a file uses a PG gems to contect to the database

    seed_sql = File.read('spec/seeds_artists.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do #calls the method defined above inorder to reset a table after each test
    reset_artists_table
  end


  it 'test for items' do

    repo = ArtistRepository.new

    artists = repo.all

    expect(artists.length).to eq(2)
    expect(artists.first.id).to eq("1") #string solution as import as string from sql
    expect(artists.first.name).to eq('Pixies')
  end
end

#expect(albums.first.title).to eq('Bossanova')
#expect(albums.first.release_year).to eq('1999')
#expect(albums.first.artist_id).to eq('1')