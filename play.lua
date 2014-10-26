
Play = State:extends{
	entities = {},
	cameraX = 0,
	cameraY = 0,
	trackTarget = nil,
}

function Play:setup()
	self.super.setup(self)
	love.graphics.setBackgroundColor(50, 0, 0)
end

function Play:track(trackTarget)
	self.trackTarget = trackTarget
end

function Play:update(dt)
	self.super.update(self, dt)
	if self.trackTarget then
		self.cameraX = self.trackTarget.x - screenWidth/2
		self.cameraY = self.trackTarget.y - screenHeight/2
	end
end

function Play:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("line", -400-self.cameraX, -400-self.cameraY,
		800, 600)
	self.super.draw(self)
end

