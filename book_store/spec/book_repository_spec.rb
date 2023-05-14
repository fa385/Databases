require 'book_repository'
#require is used to slect what ruby file the rspec should us
# i.e. run the tests on, and should be in quotation msrks

RSpec.describe BookRepository do
  
  def reset_books_table #reads a file uses a PG gems to contect to the database

    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do #calls the method defined above inorder to reset a table after each test
    reset_books_table
  end


  it 'test for items' do

    repo = BookRepository.new

    books = repo.all

    expect(books.length).to eq(2)
    expect(books.first.id).to eq("1") #string solution as import as string from sql
    expect(books.first.title).to eq('TKAM')
  end

  it 'test for presentation of results' do

    repo = BookRepository.new

    all_books = repo.all

    expect(all_books[1].id).to eq ("2")
    expect(all_books[1].title).to eq("TPOBAW")
    expect(all_books[1].author_name).to eq("Stephen Chobsky") 

  end
end
