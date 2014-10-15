
function testDesmondUpdate()
	local d = Desmond(800, 1600)
	local isDown = function(key)
		return key == "w" or key == "d"
	end

	d:update(2, isDown)
	assert(d.moving, "Speed was not set after call to update")

	local movementPerSecond = (d.speed / math.sqrt(2))
	assertApprox(800 + movementPerSecond * 2, d.x)
	assertApprox(1600 - movementPerSecond * 2, d.y)

	d:update(3, isDown)
	assertApprox(800 + movementPerSecond * 5, d.x)
	assertApprox(1600 - movementPerSecond * 5, d.y)
end

