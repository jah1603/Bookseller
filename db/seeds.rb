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
  "name" => "Penguin Classics",
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
  "url" => "/images/Two_cities.jpg",
  "summary" => "Charles Dickens's A Tale of Two Cities portrays a world on fire, split between Paris and London during the brutal and bloody events of the French Revolution. This Penguin Classics edition of is edited with an introduction and notes by Richard Maxwell.
'It was the best of times, it was the worst of times...'
After eighteen years as a political prisoner in the Bastille the aging Dr Manette is finally released and reunited with his daughter in England. There, two very different men, Charles Darnay, an exiled French aristocrat, and Sydney Carton, a disreputable but brilliant English lawyer, become enmeshed through their love for Lucie Manette. From the tranquil lanes of London, they are all drawn against their will to the vengeful, bloodstained streets of Paris at the height of the Reign of Terror and soon fall under the lethal shadow of La Guillotine.".gsub("'")
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
  "url" => "/images/wuthering_heights.jpeg",
  "summary" => "Wuthering Heights is a wild, passionate story of the intense and almost demonic love between Catherine Earnshaw and Heathcliff, a foundling adopted by Catherine's father. After Mr Earnshaw's death, Heathcliff is bullied and humiliated by Catherine's brother Hindley and wrongly believing that his love for Catherine is not reciprocated, leaves Wuthering Heights, only to return years later as a wealthy and polished man. He proceeds to exact a terrible revenge for his former miseries.
The action of the story is chaotic and unremittingly violent, but the accomplished handling of a complex structure, the evocative descriptions of the lonely moorland setting and the poetic grandeur of vision combine to make this unique novel a masterpiece of English literature.".gsub("'")
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
  "url" => "/images/lord_of_the_flies.jpeg",
  "summary" => "A plane crashes on an uninhabited island and the only survivors, a group of schoolboys, assemble on the beach and wait to be rescued. By day they inhabit a land of bright fantastic birds and dark blue seas, but at night their dreams are haunted by the image of a terrifying beast.

In this, his first novel, William Golding gave the traditional adventure story an ironic, devastating twist. The boys' delicate sense of order fades, and their childish fears are transformed into something deeper and more primitive. Their games take on a horrible significance, and before long the well-behaved party of schoolboys has turned into a tribe of faceless, murderous savages.".gsub("'")
  })
book3.save()

book4 = Book.new({
  "title" => "Lord of the Flies",
  "author" => "William Golding",
  "publication_year" => "1954",
  "quantity" => 2,
  "publisher_id" => publisher2.id,
  "genre_id" => genre1.id,
  "wholesale_price" => 3.60,
  "retail_price" => 4.25,
  "url" => "",
  "summary" => "A plane crashes on an uninhabited island and the only survivors, a group of schoolboys, assemble on the beach and wait to be rescued. By day they inhabit a land of bright fantastic birds and dark blue seas, but at night their dreams are haunted by the image of a terrifying beast.

In this, his first novel, William Golding gave the traditional adventure story an ironic, devastating twist. The boys' delicate sense of order fades, and their childish fears are transformed into something deeper and more primitive. Their games take on a horrible significance, and before long the well-behaved party of schoolboys has turned into a tribe of faceless, murderous savages."
  })
book4.save()

binding.pry
nil
