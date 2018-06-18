require_relative('../db/sql-runner')

class Genre

  attr_reader :name,

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
