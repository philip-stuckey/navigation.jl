
# NOTE

I need to find a better way to flag the destionation
I plan on giving it a very small, but non-zero cost to work with sparce matricies
I don't know what position to give it though, perhapse that may be user specifed

# what is a route?

A route should tell you:
	1. how many times you stop
	2. when you stop
	3. where you stop

in the context of a larger "map" (in the cartographic sense)

a "cartographic map" is (isomorphic to?) a complete, weighted, undirected graph where the 
weights of each edge is the distance between the two connecting nodes

a route is an ordered list of nodes in some cartographic map.

The problem is to minimize the "cost" of a route given some constraints.

# the problem
given some cartographic map, with an origin, destonation, and a set of gas stations along 
the way, find the route which minimizes the cost, with only nodes less than 
some constrained distance d.

It's actually increadibly simple. 

step 1. cut out each edge which is longer than d.
step 2. construct a graph where each edge is the cost of the destonation. 
step 3. use Dijkstra's algorithem to minimize the cost. 


# generating a cartographic map.

We might consider a predefined route between two points, with gas stations
sprinkled along it. if we stretch out 
