
function testEntityDefaultXY()
	local e = Entity({cameraX=2, cameraY=-4}, {})
	assert(e.x == 0)
	assert(e.y == 0)
end

function testEntityGetScreenPosition()
	local e = Entity({cameraX=2, cameraY=-4}, {}, 1, 0)
	local drawX, drawY = e:getScreenPosition()
	assertEq(-1, drawX)
	assertEq(4, drawY)
	e.originX = 2
	e.originY = 1.5

	local drawX, drawY = e:getScreenPosition()
	assertEq(-3, drawX)
	assertEq(2.5, drawY)
end

function testEntityUpdate()
	local e = Entity({cameraX=2, cameraY=-4}, {}, 1, 0)
	assert(type(e.update) == "function", "Entity doesn't have an update method")

	e.angle = 0
	e.speed = 4

	e:update(0.5)
	assert(e.y == 2, "Entity didn't move as expected.")
	e.angle = math.pi / 2
	e:update(0.5)
	assert(e.x == 3, "Entity didn't move as expected.")
	e.angle = -math.pi / 2
	e:update(0.5)
	assert(e.x == 1, "Entity didn't move as expected.")
end

