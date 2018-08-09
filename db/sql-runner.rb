require('pg')
class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'bookseller', host: 'localhost', port: 5432, user: 'oznzdkxfgmejac', password: '0d49e4df2156330b1bdeb3ee08bb4b8de025e3f49a449a05d29135ef820bec4d' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
