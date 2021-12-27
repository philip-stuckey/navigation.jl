
@testset "makes sure some easy examples make sense" begin
	@testset "if the origin and destonation are within range, there should be no stops" begin
		@test find_route() == [0, 1]
	end

	@testset "if the origin and destonation are out of range, but there is a stop in between, then a path with one stop should exist" begin
		@test false
	end

	@testset "if there are multiple 1-stop routes, then the cheepest one should be selected" begin
		@test false
	end
end
