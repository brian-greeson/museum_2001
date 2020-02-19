require "pry"
require "minitest/autorun"
require "mocha/minitest"
require "./lib/patron"
require "./lib/exhibit"

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
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})

    assert_equal false, patron_1.interested?(imax)
    assert_equal false, patron_1.interested?(dead_sea_scrolls)

    patron_1.add_interest("Dead Sea Scrolls")

    assert_equal false, patron_1.interested?(imax)
    assert_equal true, patron_1.interested?(dead_sea_scrolls)

    patron_1.add_interest("IMAX")

    assert_equal true, patron_1.interested?(imax)
    assert_equal true, patron_1.interested?(dead_sea_scrolls)

  end

end
