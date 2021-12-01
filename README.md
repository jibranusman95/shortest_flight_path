# shortest_flight_path
Shortest path for connecting flights with cost

```# Input format
from = 'JFK'
to = 'LAX'
upto = 3

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

# results in
# JFK->ATL->ORD->LAX, Total cost: 440
