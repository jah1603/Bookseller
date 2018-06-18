require('pry-byebug')
require_relative('../models/books.rb')
require_relative('../models/publishers.rb')
require_relative('../models/genres.rb')

Publisher.delete_all()
Genre.delete_all()
Game.delete_all()

publisher1 = Publisher.new({
  "name" => "Bethesda Softworks",
  "address" => "1370 Piccard Drive",
  "city" => "Rockville",
  "region" => ""
  "country" => "USA",
  "postcode" => "MD 20850",
  "tel" => "0799 653 6432",
  "email" => "info@bethsoft.com"
  })
publisher1.save()
