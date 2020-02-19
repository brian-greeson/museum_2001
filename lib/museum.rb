class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommend = @exhibits.select { |exhibit| patron.interests.include?(exhibit.name)}
    recommend.sort_by {|exhibit| exhibit.name}
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    @exhibits.reduce({}) do |acc, exhibit|
      acc[exhibit] = @patrons.select {|patron| patron.interests.include?(exhibit.name)}
      acc
      
    end
  end

end
