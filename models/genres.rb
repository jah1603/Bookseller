require_relative('../db/sql-runner')
require_relative('../models/books.rb')
require_relative('../models/publishers.rb')

class Genre

  attr_reader :name, :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO genres
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@name]
    genre_data = SqlRunner.run(sql, values)
    @id = genre_data.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM genres;"
    SqlRunner.run(sql)
  end

  def publisher()
  sql = "SELECT publishers.* FROM publishers
  INNER JOIN books ON books.publisher_id = publishers.id
  WHERE genre_id = $1"
  values = [@id]
  publishers = SqlRunner.run(sql, values)
  return Publisher.map_items(publishers)
end

def book()
  sql = "SELECT books.* FROM books WHERE genre_id = $1"
  values = [@id]
  books = SqlRunner.run(sql, values)
  return Book.map_items(books)
end

  def self.all()
    sql = "SELECT * FROM genres"
    genres = SqlRunner.run( sql )
    result = genres.map { |genre| Genre.new( genre ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM genres WHERE id = $1"
    values = [id]
    genre = SqlRunner.run( sql, values )
    result = Genre.new( genre.first )
    return result
  end

end
