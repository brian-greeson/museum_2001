class Patron
  attr_reader :name, :spending_money, :interests
  def initialize(name, money)
    @name = name
    @spending_money = money
    @interests = []
  end

  def add_interest(interest)
    @interests << interest
  end

  def interested?(exhibit)
    @interests.include?(exhibit.name)
  end


end
