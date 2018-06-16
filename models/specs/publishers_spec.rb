require("minitest/autorun")
require_relative("../publishers.rb")

class TestPublisher < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Penguin Group", "address" => "80 Strand",
      "city" => "London", "region" => "Greater London", "country" => "United Kingdom", "postcode" => "WC2R 0RL", "tel" => "+44 0(20) 7139 3000", "email" => "ggillings@penguinrandomhouse.co.uk"}
    @publisher = Publisher.new(options)
  end

  def test_name()
    result = @publisher.name()
    assert_equal("Penguin Group", result)
  end

  def test_address()
    result = @publisher.address()
    assert_equal("80 Strand", result)
  end

  def test_city()
    result = @publisher.city()
    assert_equal("London", result)
  end

  def test_region()
    result = @publisher.region()
    assert_equal("Greater London", result)
  end

  def test_country()
    result = @publisher.country()
    assert_equal("United Kingdom", result)
  end

  def test_postcode()
    result = @publisher.postcode()
    assert_equal("WC2R 0RL", result)
  end

  def test_tel()
    result = @publisher.tel()
    assert_equal("+44 0(20) 7139 3000", result)
  end

  def test_email()
    result = @publisher.email()
    assert_equal("ggillings@penguinrandomhouse.co.uk", result)
  end

end
