require_relative('../db/sql-runner')

class Book

  attr_accessor :title, :author, :publication_year, :quantity, :publisher_id, :genre_id, :wholesale_price, :retail_price, :url
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @author = options['author']
    @publication_year = options['publication_year']
    @quantity = options['quantity'].to_i
    @publisher_id = options['publisher_id'].to_i
    @genre_id = options['genre_id'].to_i
    @wholesale_price = options['wholesale_price'].to_f.round(2)
    @retail_price = options['retail_price'].to_f.round(2)
    @url = options['url']
  end

  def save()
    sql = "INSERT INTO books
    (
      title, author, publication_year, quantity, publisher_id, genre_id, wholesale_price, retail_price, url
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8, $9
    )
    RETURNING *"
    values = [@title, @author, @publication_year, @quantity, @publisher_id, @genre_id, @wholesale_price, @retail_price, @url]
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

  def self.all_low()
   sql = "SELECT * FROM books WHERE quantity < 5 ORDER BY title ASC"
   stocks = SqlRunner.run(sql)
   result = stocks.map{ |stock| Book.new(stock)}
   return result
 end

  def self.find( id )
    sql = "SELECT * FROM books WHERE id = $1"
    values = [id]
    book = SqlRunner.run( sql, values )
    result = Book.new( book.first )
    return result
  end

  def publisher()
  sql = "SELECT publishers.* FROM publishers WHERE id = #{@publisher_id}"
  result = SqlRunner.run(sql)
  publisher_info = result[0]
  publisher = Publisher.new(publisher_info)
  return publisher.name
end

def genre()
  sql = "SELECT genres.* FROM genres WHERE id = #{@genre_id}"
  result = SqlRunner.run(sql)
  genre_info = result[0]
  genre = Genre.new(genre_info)
  return genre.name
end

def self.map_items(book_data)
  return book_data.map { |book| Book.new(book) }
end

def markup()
  margin = @retail_price - @wholesale_price
  markup = (margin * 100) / @wholesale_price
  return markup.to_f.round(1)
end

  def color()
    if @quantity >= 5
      result = "green"
    else
      result = "red"
    end
    return result.to_s
  end

  def image()
    if @url.empty?
      image = "/images/no_image.png"
    else
      image = @url
    end
    return image
  end

end
