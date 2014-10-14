
function testEntityDefaultXY()
	local e = Entity({})
	assert(e.x == 0)
	assert(e.y == 0)
end

function testEntityGetScreenPosition()
	local e = Entity({}, 1, 0)
	local drawX, drawY = e:getScreenPosition(2, -4)
	assertEq(-1, drawX)
	assertEq(4, drawY)

	e.originX = 2
	e.originY = 1.5
	local drawX, drawY = e:getScreenPosition(2, -4)
	assertEq(-3, drawX)
	assertEq(2.5, drawY)
end

function testEntityUpdate()
	state = {cameraX=2, cameraY=-4}

	local e = Entity({}, 1, 0)
	assertIs("function", e.update, "Entity doesn't have an update method")

	e.angle = 0
	e.speed = 4

	e:update(0.5)
	assertEq(1, e.x)
	assertEq(0, e.y)

	e.moving = true
	e:update(0.5)
	assertEq(1, e.x)
	assertEq(2, e.y)

	e.angle = math.pi / 2
	e:update(0.5)
	assertEq(3, e.x)
	assertEq(2, e.y)

	e.angle = -math.pi / 2
	e:update(0.5)
	assertEq(1, e.x)
	assertEq(2, e.y)
end

