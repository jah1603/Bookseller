require("minitest/autorun")
require_relative("../books.rb")

class TestBook < MiniTest::Test

  def setup
    options = {"id" => 1, "title" => "A Tale of Two Cities", "author" => "Charles Dickens",
      "publication_year" => "1859", "quantity" => 2, "publisher_id" => publisher1.id, "genre_id" => genre1.id, "wholesale_price" => 3.25, "retail_price" => 4.50, "url" => ".../images/Two_cities.jpeg"}
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
