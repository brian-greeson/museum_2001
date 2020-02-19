require "pry"
require "minitest/autorun"
require "mocha/minitest"
require "./lib/patron"

class PatronTest < Minitest::Test

  def test_it_exists
    assert_instance_of Patron, Patron.new("Bob", 20)
  end

  def test_it_has_attributes
    patron_1 = Patron.new("Bob", 20)
    assert_equal "Bob", patron_1.name
    assert_equal 20, patron_1.spending_money
    assert_equal [], patron_1.interests
  end

  def test_it_can_add_interest
    patron_1 = Patron.new("Bob", 20)

    assert_equal [], patron_1.interests
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], patron_1.interests
  end

  def test_knows_if_it_is_interested_in_exhibit
    patron_1 = Patron.new("Bob", 20)

    assert_equal false, patron_1.interested?("IMAX")
    assert_equal false, patron_1.interested?("Dead Sea Scrolls")

    patron_1.add_interest("Dead Sea Scrolls")

    assert_equal false, patron_1.interested?("IMAX")
    assert_equal true, patron_1.interested?("Dead Sea Scrolls")  
  end

end
