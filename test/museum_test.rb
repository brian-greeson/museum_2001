require "pry"
require "minitest/autorun"
require "mocha/minitest"
require "./lib/museum"

class MuseumTest < Minitest::Test

  def test_it_exists
    assert_instance_of Museum, Museum.new("Denver Museum of Nature and Science")
  end

end
