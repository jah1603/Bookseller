require_relative('../db/sql-runner')
require_relative('../models/books.rb')

class Publisher

  attr_reader :name, :id, :address, :city, :region, :country, :country, :postcode, :tel, :email

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @city = options['city']
    @region = options['region']
    @country = options['country']
    @postcode = options['postcode']
    @tel = options['tel']
    @email = options['email']
  end

  def save()
    sql = "INSERT INTO publishers
    (
      name, address, city, region, country, postcode, tel, email
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING *"
    values = [@name, @address, @city, @region, @country, @postcode, @tel, @email]
    publisher_data = SqlRunner.run(sql, values)
    @id = publisher_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE publishers
    SET
    (
      name, address, city, region, country, postcode, tel, email
    ) =
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    WHERE id = $9"
    values = [@title, @author, @publication_year, @quantity, @publisher_id, @genre_id, @wholesale_price, @retail_price, @url]
    publisher_data = SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM publishers;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM publishers"
    publishers = SqlRunner.run( sql )
    result = publishers.map { |publisher| Publisher.new( publisher ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM publishers WHERE id = $1"
    values = [id]
    publisher = SqlRunner.run( sql, values )
    result = Publisher.new( publisher.first )
    return result
  end

  def book()
    sql = "SELECT books.* FROM books WHERE publisher_id = $1"
    values = [@id]
    books = SqlRunner.run(sql, values)
    return Book.map_items(books)
  end

  def self.map_items(publisher_data)
    return publisher_data.map { |publisher| Publisher.new(publisher) }
  end

end
