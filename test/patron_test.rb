require "pry"
require "minitest/autorun"
require "mocha/minitest"
require "./lib/patron"

class PatronTest < Minitest::Test

  def test_it_exists
    assert_instance_of Patron, Patron.new("Bob", 20)
  end

end
# pry(main)> require './lib/exhibit'
# # => true
#
# pry(main)> require './lib/patron'
# # => true


#
# pry(main)> patron_1 = Patron.new("Bob", 20)
# # => #<Patron:0x00007fcb13b5c7d8...>
#
# pry(main)> patron_1.name
# # => "Bob"
#
# pry(main)> patron_1.spending_money
# # => 20
#
# pry(main)> patron_1.interests
# # => []
#
# pry(main)> patron_1.add_interest("Dead Sea Scrolls")
#
# pry(main)> patron_1.add_interest("Gems and Minerals")
#
# pry(main)> patron_1.interests
# # => ["Dead Sea Scrolls", "Gems and Minerals"]
