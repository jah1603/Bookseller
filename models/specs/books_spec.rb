require("minitest/autorun")
require_relative("../books.rb")

class TestBook < MiniTest::Test

  def setup
    options = {"id" => 1, "title" => "A Tale of Two Cities", "author" => "Charles Dickens",
      "publication_year" => "1859", "quantity" => 2, "publisher_id" => publisher1.id, "genre_id" => genre1.id, "wholesale_price" => 3.25, "retail_price" => 4.50, "url" => ".../images/Two_cities.jpeg",
    summary => "Charles Dickens's A Tale of Two Cities portrays a world on fire, split between Paris and London during the brutal and bloody events of the French Revolution. This Penguin Classics edition of is edited with an introduction and notes by Richard Maxwell.
  'It was the best of times, it was the worst of times...'
  After eighteen years as a political prisoner in the Bastille the aging Dr Manette is finally released and reunited with his daughter in England. There, two very different men, Charles Darnay, an exiled French aristocrat, and Sydney Carton, a disreputable but brilliant English lawyer, become enmeshed through their love for Lucie Manette. From the tranquil lanes of London, they are all drawn against their will to the vengeful, bloodstained streets of Paris at the height of the Reign of Terror and soon fall under the lethal shadow of La Guillotine."}
    @book = Book.new(options)
  end

  def test_title()
    result = @book.title()
    assert_equal("A Tale of Two Cities", result)
  end

  def test_author()
    result = @book.author()
    assert_equal("Charles Dickens", result)
  end

  def test_publication_year()
    result = @book.publication_year()
    assert_equal("1859", result)
  end

  def test_quantity()
    result = @book.quantity()
    assert_equal(2, result)
  end

  def wholesale_price()
    result = @book.wholesale_price()
    assert_equal(3.25, result)
  end

  def test_retail_price()
    result = @book.retail_price()
    assert_equal(4.50, result)
  end

  def test_url()
    result = @book.url()
    assert_equal(".../images/Two_cities.jpeg", result)
  end

end
