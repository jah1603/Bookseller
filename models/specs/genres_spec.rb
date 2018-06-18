require("minitest/autorun")
require_relative("../genres.rb")

class TestGenre < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Classics"}
    @genre = Genre.new(options)
  end

  def test_name()
    result = @genre.name()
    assert_equal("Classics", result)
  end

end
