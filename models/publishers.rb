publishersrequire_relative('../db/sql-runner')

class Publisher

  attr_reader :name, :id

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



end
