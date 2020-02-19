require "pry"
require "minitest/autorun"
require "mocha/minitest"
require "./lib/museum"

class MuseumTest < Minitest::Test

  def test_it_exists
    assert_instance_of Museum, Museum.new("Denver Museum of Nature and Science")
  end

  def test_it_has_attributes
    dmns = Museum.new("Denver Museum of Nature and Science")
    
    assert_equal "Denver Museum of Nature and Science", dmns.name
    assert_equal [], dmns.exhibits
  end

end
