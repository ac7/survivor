
-- Entity is the baseclass of everything that can appear on the screen.
Entity = class{
	-- These are the top-left coordinates of the entity.
	x = 0, y = 0,

	moving = false,
	angle = 0, -- All angles are in radians.
	speed = 128, -- Speed is measured in pixels-per-second.

	-- Image-related variables. The origin- variables can be set to draw the
	-- `img` centered on the x and y coordinates.
	img = nil,
	originX = 0,
	originY = 0,
}

-- `x` and `y` are the inital coordinates of the Entity and are optional
-- parameters.
function Entity:__init(img, x, y)
	assert(img)
	self.img = img

	self.x = x or 0
	self.y = y or 0
	assertIs("number", self.x)
	assertIs("number", self.y)
end

-- When update is called, `x` and `y` will be moved in the direction of `angle`
-- at `speed` (iff `moving` is true).
function Entity:update(dt)
	if not self.moving then return; end

	self.x = self.x + math.sin(self.angle) * self.speed * dt
	self.y = self.y + math.cos(self.angle) * self.speed * dt
end

-- getScreenPosition() returns (x, y) coordinates representing the center of
-- where the entity should be drawn on the screen. Useful for overriding
-- `draw()`.
function Entity:getScreenPosition(cameraX, cameraY)
	return (self.x - cameraX - self.originX),
	       (self.y - cameraY - self.originY)
end

-- This method does access the global `state` variable. Justification: this
-- method is only called when the entity is drawn.
function Entity:draw()
	local drawX, drawY = self:getScreenPosition(state.cameraX, state.cameraY)
	love.graphics.draw(self.img, drawX, drawY)
end

