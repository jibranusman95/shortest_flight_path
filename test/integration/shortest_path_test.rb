require '../../src/shortest_path.rb'

from = 'JFK'
to = 'LAX'
upto = 3

# Input format
list = [
  Flight.new('JFK', 'ATL', 150),
  Flight.new('ATL', 'SFO', 400),
  Flight.new('ORD', 'LAX', 200),
  Flight.new('LAX', 'DFW', 80),
  Flight.new('JFK', 'HKG', 800),
  Flight.new('ATL', 'ORD', 90),
  Flight.new('JFK', 'LAX', 500),
]

puts ShortestPath.shortest_path_with_cost(list, from, to, upto)
