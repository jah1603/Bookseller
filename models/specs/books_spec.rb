require("minitest/autorun")
require_relative("../books.rb")

class Testbook < MiniTest::Test

  def setup
    options = {"id" => 1, "title" => "A Tale of Two Cities", "author" => "Charles Dickens",
      "publication_year" => 1859, "quantity" => 2, "publisher_id" => 1, "genre_id" => 1, "wholesale_price" => "WC2R 0RL", "retail_price" => "+44 0(20) 7139 3000", "url" => "ggillings@penguinrandomhouse.co.uk"}
    @book = book.new(options)
  end

  def test_title()
    result = @book.name()
    assert_equal("Penguin Group", result)
  end

  def test_author()
    result = @book.address()
    assert_equal("80 Strand", result)
  end

  def test_city()
    result = @book.city()
    assert_equal("London", result)
  end

  def test_region()
    result = @book.region()
    assert_equal("Greater London", result)
  end

  def test_country()
    result = @book.country()
    assert_equal("United Kingdom", result)
  end

  def test_postcode()
    result = @book.postcode()
    assert_equal("WC2R 0RL", result)
  end

  def test_tel()
    result = @book.tel()
    assert_equal("+44 0(20) 7139 3000", result)
  end

  def test_email()
    result = @book.email()
    assert_equal("ggillings@penguinrandomhouse.co.uk", result)
  end

end
