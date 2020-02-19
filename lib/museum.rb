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
    recommend = @exhibits.select { |exhibit| patron.interested?(exhibit)}
    recommend.sort_by {|exhibit| exhibit.name}
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    @exhibits.reduce({}) do |acc, exhibit|
      acc[exhibit] = @patrons.select {|patron| patron.interested?(exhibit)}
      acc
    end
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.select { |patron| patron.interested?(exhibit) && patron.spending_money < exhibit.cost }
  end

  def draw_lottery_winner(exhibit)
    ticket_lottery_contestants(exhibit).sample
  end

end
