require_relative('../db/sql-runner')

class Book

  attr_accessor :title, :author, :publication_year, :quantity, :publisher_id, :genre_id, :wholesale_price, :retail_price, :url, :summary, :copies_sold, :id

  def initialize(options)
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
    @summary = options['summary']
    @copies_sold = options['copies_sold'].to_i
  end

  def save()
    sql = "INSERT INTO books
    (
      title, author, publication_year, quantity, publisher_id, genre_id, wholesale_price, retail_price, url, summary, copies_sold
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
    )
    RETURNING *"
    values = [@title, @author, @publication_year, @quantity, @publisher_id, @genre_id, @wholesale_price, @retail_price, @url, @summary, @copies_sold]
    book_data = SqlRunner.run(sql, values)
    @id = book_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE books SET
    title = '#{@title}',
    author = '#{@author}',
    publication_year = '#{@publication_year}',
    quantity = '#{@quantity}',
    publisher_id = '#{@publisher_id}',
    genre_id = '#{@genre_id}',
    wholesale_price = '#{@wholesale_price}',
    retail_price = '#{@retail_price}',
    url = '#{@url}',
    summary = '#{@summary}',
    copies_sold = '#{@copies_sold}'
    WHERE id = #{@id}"
    SqlRunner.run(sql)
  end


  def self.delete_all()
    sql = "DELETE FROM books;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM books WHERE id = #{@id}"
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
    image = "/images/nocover.png"
  else
    image = @url
  end
  return image
end

def wholesale_price
  return '%.2f' % @wholesale_price
end

def retail_price
  return '%.2f' % @retail_price
end

def self.bestseller
  copies = []
  for book in Book.all()
    copies.push(book.copies_sold)
  end
  ids = []
  for book in Book.all()
    ids.push(book.id)
  end
  title_max_copy_index = copies.index(copies.max)
return Book.find(ids[title_max_copy_index])
end

def self.worstseller
  copies = []
  for book in Book.all()
    copies.push(book.copies_sold)
  end
  ids = []
  for book in Book.all()
    ids.push(book.id)
  end
  title_min_copy_index = copies.index(copies.min)
return Book.find(ids[title_min_copy_index])
end

def self.mostprofit
  profits = []
  for book in Book.all()
    profits.push(book.quantity*((book.retail_price.to_i)-(book.wholesale_price.to_i)))
  end
  ids = []
  for book in Book.all()
    ids.push(book.id)
  end
  title_max_profit_index = profits.index(profits.max)
return Book.find(ids[title_max_profit_index])
end

def self.leastprofit
  profits = []
  for book in Book.all()
    profits.push(book.copies_sold*((book.retail_price.to_i)-(book.wholesale_price.to_i)))
  end
  ids = []
  for book in Book.all()
    ids.push(book.id)
  end
  title_min_profit_index = profits.index(profits.min)
return Book.find(ids[title_min_profit_index])
end

def profit
  return '%.2f' % (@copies_sold*((@retail_price.to_f.round(2))-(@wholesale_price.to_f.round(2)))).to_f.round(2)
end

def sale()
  @quantity -= 1 if @quantity != 0
    return @quantity
end

def units_up()
  @copies_sold += 1 if @quantity != 0
  return @copies_sold
end

end
