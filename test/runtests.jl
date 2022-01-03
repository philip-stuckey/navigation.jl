using Test
using Navigation

@testset "if the origin and destonation are within range, there should be no stops" begin
	@test find_route([StartPoint(), EndPoint(1.0)], range=1.1) == [1, 2]
	@test find_route([StartPoint(), WayPoint(0.5, 1.0), EndPoint()]) == [1, 3]
	@test find_route([StartPoint(), WayPoint(0.5, 0.0), EndPoint()]) == [1, 3]
end

@testset "if the origin and destonation are out of range, but there is a stop in between, then a path with one stop should exist" begin
	@test find_route([StartPoint(),WayPoint(0.5, 1.0),EndPoint(1.1)], range=1.0) == [1, 2, 3]
end

@testset "if there are multiple 1-stop routes, then the cheepest one should be selected" begin
	@test find_route([			startPoint(),
			WayPoint(0.5, 1.0),
			WayPoint(0.5, 2.0),
			WayPoint(0.5, 3.0),
			EndPoint(1.1)
		],
		range=1.0
	) = [1,2,5]
end
