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

publisher2 = Publisher.new({
  "name" => "Penguins Group",
  "address" => "80 Strand",
  "city" => "London",
  "region" => "Greater London",
  "country" => "United Kingdom",
  "postcode" => "WC2R 0RL",
  "tel" => "+44 0(20) 7139 3000",
  "email" => "ggillings@penguinrandomhouse.co.uk"
  })
publisher2.save()

genre1 = Genre.new({
  "name" => "Classics"
  })
genre1.save()

genre2 = Genre.new({
  "name" => "Literary Fiction"
  })
genre2.save()

genre3 = Genre.new({
  "name" => "Teen and Young Adult Fiction"
  })
genre3.save()

genre4 = Genre.new({
  "name" => "Health and Lifestyle"
  })
genre4.save()

genre5 = Genre.new({
  "name" => "Travel"
  })
genre5.save()

genre6 = Genre.new({
  "name" => "Music"
  })
genre6.save()

genre7 = Genre.new({
  "name" => "Crime"
  })
genre7.save()

genre8 = Genre.new({
  "name" => "Sport"
  })
genre8.save()

genre9 = Genre.new({
  "name" => "History"
  })
genre9.save()

genre10 = Genre.new({
  "name" => "Politics"
  })
genre10.save()

genre11 = Genre.new({
  "name" => "Science"
  })
genre11.save()

genre12 = Genre.new({
  "name" => "Foreign Literature"
  })
genre12.save()

genre13 = Genre.new({
  "name" => "Autobiography"
  })
genre13.save()

genre14 = Genre.new({
  "name" => "Science Fiction"
  })
genre14.save()

genre15 = Genre.new({
  "name" => "Contemporary Fiction"
  })
genre15.save()

book1 = Book.new({
  "title" => "A Tale of Two Cities",
  "author" => "Charles Dickens",
  "publication_year" => "1859",
  "quantity" => 2,
  "publisher_id" => publisher1.id,
  "genre_id" => genre1.id,
  "wholesale_price" => 3.25,
  "retail_price" => 4.50,
  "url" => "/images/Two_cities.jpg"
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
  "url" => "/images/Wuthering_heights.jpeg"
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
  "url" => "/images/Two_cities.jpeg"
  })
book3.save()

binding.pry
nil
