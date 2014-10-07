
Entity = class{
	x = 0,
	y = 0,
	angle = 0,
	speed = 0,
	img = nil,
	originX = 0,
	originY = 0,
	container = nil,
}

function Entity:__init(container, img, x, y)
	assert(img)
	self.img = img

	assert(type(x) == "number")
	assert(type(y) == "number")
	self.x = x
	self.y = y

	assert(type(container) == "table")
	assert(type(container.cameraX) == "number")
	assert(type(container.cameraY) == "number")
	self.container = container
end

function Entity:update(dt)
	self.x = self.x + math.sin(self.angle) * self.speed * dt
	self.y = self.y + math.cos(self.angle) * self.speed * dt
end

-- getScreenPosition() returns (x, y) coordinates representing where the entity
-- should be drawn on the screen. Useful for overriding `draw()`
function Entity:getScreenPosition()
	return (self.x - self.container.cameraX),
	       (self.y - self.container.cameraY)
end

function Entity:draw()
	local drawX, drawY = self:getScreenPosition()
	love.graphics.draw(self.img, drawX, drawY, 1, 1, self.originX, self.originY)
end

