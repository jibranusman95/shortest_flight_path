class Path
  attr_accessor :flights, :total_cost, :destination

  def initialize(start_flight = nil, destination = nil)
    @flights = []
    @flights.push start_flight if start_flight != nil
    @total_cost = start_flight&.cost || 0
    @destination = destination
  end

  def add_flight!(flight)
    @flights.push flight
    @total_cost += flight.cost
  end

  def clone
    path = self.class.new
    path.flights = flights.dup
    path.total_cost = total_cost
    path.destination = destination

    path
  end

  def connections
    flights.size
  end

  def destination_reached?
    flights.last.to == destination
  end

  def flight_link_as_string
    flights.map(&:from).push(flights.last.to).join('->')
  end
end
