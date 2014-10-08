
function testDesmondUpdate()
	local d = Desmond({cameraX=0, cameraY=0}, {}, 800, 1600)
	local isDown = function(key)
		return key == "w" or key == "d"
	end

	assert(d.speed == 0)
	d:update(1, isDown)
	assert(d.speed == desmondSpeed, "Speed was not set after call to update")

	assert(d.y == 1600 - (d.speed / math.sqrt(2)))
	assert(d.x == 800 + (d.speed / math.sqrt(2)))
end

