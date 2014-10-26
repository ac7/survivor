
-- Comrade is a subclass of entity that can take orders and will move to
-- position.
Comrade = Entity:extends{
	speed = 450,

	targetX = 0,
	targetY = 0,
}

function Comrade:__init(x, y)
	self.targetX = x
	self.targetY = y
	self.super.__init(self, x, y)
end

function Comrade:orderTo(targetX, targetY)
	self.targetX, self.targetY = targetX, targetY
	self.moving = true
end

function Comrade:update(dt)
	if not self.moving then return; end

	-- if we are very close to the target, then we can snap to it
	-- immediately and stop moving.
	if distance(self.x, self.y, self.targetX, self.targetY) <
		self.speed * dt then

		self.moving = false
		self.x, self.y = self.targetX, self.targetY
		return
	end

	self.angle = math.atan2(self.targetX - self.x, self.targetY - self.y)
	self.super.update(self, dt)
end

function Comrade:draw()
	local drawX, drawY = self:getScreenPosition(state.cameraX, state.cameraY)
	love.graphics.setColor(0, 255, 0)
	love.graphics.circle("fill", drawX, drawY, 32)
end

