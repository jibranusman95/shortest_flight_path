require_relative './components/flight.rb'
require_relative './components/path.rb'

class ShortestPath
  def self.shortest_path_with_cost(list, from, to, upto)
    paths = []

    # Create intial paths
    list.each do |item|
      if item.from == from
        path = Path.new(list.delete(item), to)
        paths.push(path)
      end
    end

    # Case if no initial paths are found
    return 'No flights' if paths.size == 0

    additions = 1
    while(additions > 0) do
      new_paths = []
      additions = 0

      paths.each do |path|
        items = list.select { |item| path.flights.last.to == item.from && !path.destination_reached? }

        multiple_paths = [path]
        (1...items.size).each { |index| multiple_paths.push(path.clone) }

        items.each_with_index do |itm, index|
          flight = list.delete(itm)
          multiple_paths[index].add_flight!(flight)
          additions += 1
        end

        new_paths += multiple_paths
      end

      paths = new_paths
    end

    min_cost = 9999999999
    min_cost_index = -1

    paths.each_with_index do |path, index|
      if path.destination_reached? && path.connections <= upto && path.total_cost < min_cost
        min_cost = path.total_cost
        min_cost_index = index
      end
    end

    shortest_path = paths[min_cost_index]
    "#{shortest_path.flight_link_as_string}, Total cost: #{shortest_path.total_cost}"
  end
end
