require('pry-byebug')
require_relative('../models/books.rb')
require_relative('../models/publishers.rb')
require_relative('../models/genres.rb')

Publisher.delete_all()
Genre.delete_all()
Book.delete_all()

publisher1 = Publisher.new({
  "name" => "Penguin Group",
  "address" => "80 Strand",
  "city" => "London",
  "region" => "Greater London",
  "country" => "United Kingdom",
  "postcode" => "WC2R 0RL",
  "tel" => "+44 0(20) 7139 3000",
  "email" => "ggillings@penguinrandomhouse.co.uk"
  })
publisher1.save()

genre1 = Genre.new({
  "name" => "Classics"
  })
genre1.save()

book1 = Book.new({
  "title" => "A Tale of Two Cities",
  "author" => "Charles Dickens",
  "publication_year" => "1859",
  "quantity" => 2,
  "publisher_id" => publisher1.id,
  "genre_id" => genre1.id,
  "wholesale_price" => 3.25,
  "retail_price" => 4.50,
  "url" => "../public/images/Two_cities.jpg"
  })
book1.save()

book2 = Book.new({
  "title" => "Wuthering Heights",
  "author" => "Emily Brontë",
  "publication_year" => "1847",
  "quantity" => 5,
  "publisher_id" => publisher1.id,
  "genre_id" => genre1.id,
  "wholesale_price" => 2.25,
  "retail_price" => 5.50,
  "url" => "../public/images/Wuthering_heights.jpeg"
  })
book2.save()

book3 = Book.new({
  "title" => "Lord of the Flies",
  "author" => "William Golding",
  "publication_year" => "1954",
  "quantity" => 2,
  "publisher_id" => publisher1.id,
  "genre_id" => genre1.id,
  "wholesale_price" => 3.60,
  "retail_price" => 4.25,
  "url" => "../public/images/Two_cities.jpeg"
  })
book3.save()

binding.pry
nil
