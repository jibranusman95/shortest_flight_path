class Flight
  attr_reader :from, :to, :cost

  def initialize(from, to, cost)
    @from = from
    @to = to
    @cost = cost
  end
end
