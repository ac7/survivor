
Entity = class{
	x = 0,
	y = 0,
	angle = 0,
	speed = 1,
	img = nil,
	originX = 0,
	originY = 0,
}

function Entity:__init(img, x, y)
	assert(img)
	assert(type(x) == "number")
	assert(type(y) == "number")
	self.img = img
	self.x = x
	self.y = y
end

function Entity:update(dt)
	self.x = self.x + math.sin(self.angle) * self.speed * dt
	self.y = self.y + math.cos(self.angle) * self.speed * dt
end

function Entity:draw()
	love.graphics.draw(self.img, self.x, self.y, 1, 1, self.originX, self.originY)
end

function testEntityMovement()
	local e = Entity({}, 1, 0)
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

