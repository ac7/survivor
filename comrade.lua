
-- Comrade is a subclass of entity that can take orders and will move to
-- position.
Comrade = Entity:extends{
	originX = 25,
	originY = 25,
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
	self.angle = math.atan2(self.targetX - self.x, self.targetY - self.y)

	self.super.update(self, dt)
end

