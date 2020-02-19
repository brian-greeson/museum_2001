class Museum
  attr_reader :name, :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommend = @exhibits.select { |exhibit| patron.interests.include?(exhibit.name)}
    recommend.sort_by {|exhibit| exhibit.name}
  end

end
