require 'album_repository'
#require is used to slect what ruby file the rspec should us
# i.e. run the tests on, and should be in quotation msrks

RSpec.describe AlbumRepository do
  
  def reset_albums_table #reads a file uses a PG gems to contect to the database

    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do #calls the method defined above inorder to reset a table after each test
    reset_albums_table
  end


  it 'test for items' do

    repo = AlbumRepository.new

    albums = repo.all

    expect(albums.first.title).to eq('Bossanova')
    expect(albums.first.release_year).to eq('1999')
    expect(albums.first.artist_id).to eq('1')
  end
end