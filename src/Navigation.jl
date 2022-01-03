module Navigation 

export find_route, WayPoint, StartPoint, EndPoint

using Graphs, SimpleWeightedGraphs, SparseArrays

struct WayPoint
	position::Float64
	cost::Float64
end

# the cost of a waypoint can never be zero, because of how the underlying graph
# representation works
StartPoint() = WayPoint(0, eps(0.0))
EndPoint(total_distance=1.0) = WayPoint(total_distance, eps(0.0))

function find_route(stops::Vector{WayPoint}; range=Inf)
	origin = 1
	destination = length(stops) #  it is assumed that the last stop is the destination
	
	# step 1: construct the distance-weighted graph for pit stops
	# step 2: cut out any edges which are longer than the range
	# step 3: from this subset of edges, construct the cost-weighted graph
	cost_graph = SimpleWeightedGraph(
		sparse(
			[if abs(s.position - t.position) > range 
				0
			else
				ifelse(s.position > t.position, s.cost, t.cost)
			end
			for s in stops, t in stops]
		 )
	)
	
	# step 4: use Dijkstra's algorithem to find the optimal route. 
	route = enumerate_paths(dijkstra_shortest_paths(cost_graph, origin), destination)
	return route
end

end
