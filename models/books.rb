require_relative('../db/sql-runner')

class Book

  attr_reader :title, :id, :author, :publication_year, :quantity, :publisher_id, :genre_id, :wholesale_price, :retail_price, :url

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @author = options['author']
    @publication_year = options['publication_year']
    @quantity = options['quantity']
    @publisher_id = options['publisher_id']
    @genre_id = options['genre_id']
    @wholesale_price = options['wholesale_price']
    @retail_price = options['retail_price']
    @url = options['url']
  end

  def save()
    sql = "INSERT INTO books
    (
      title, author, publication_year, quantity, publisher_id, genre_id, wholesale_price, retail_price, url
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8, $9
    )
    RETURNING *"
    values = [@name]
    book_data = SqlRunner.run(sql, values)
    @id = book_data.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM books;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM books"
    books = SqlRunner.run( sql )
    result = books.map { |book| Book.new( book ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM books WHERE id = $1"
    values = [id]
    book = SqlRunner.run( sql, values )
    result = Book.new( book.first )
    return result
  end

end
