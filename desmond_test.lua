
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

function testDesmondMousepressed()
	-- Set up a mock state with two entities. The first entity is within
	-- range of a swing, the second is out of range.
	local correctDamageTaken = false
	local incorrectDamageTaken = false
	local mockState = {
		setup = function() end,
		entities = {{
			takeDamage = function() correctDamageTaken = true; end,
			x = 10,
			y = 10,
		},
		{
			takeDamage = function() incorrectDamageTaken = true; end,
			x = -150,
			y = -150,
		}},
	}
	setState(mockState)

	local d = Desmond(11, 9)

	-- assert that the middle mouse button does nothing
	d:mousepressed(0, 0, "m")
	assertEq(0, d.swing)
	assertEq(false, correctDamageTaken)
	assertEq(false, incorrectDamageTaken)

	-- assert that the left mouse button causes a swing to begin, but that
	-- it only affects the correct entity
	d:mousepressed(0, 0, "l")
	assertEq(Desmond.swingDuration, d.swing)
	assertEq(true, correctDamageTaken)
	assertEq(false, incorrectDamageTaken)
end

