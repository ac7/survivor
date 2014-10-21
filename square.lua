
Square = Entity:extends{}

function Square:__init(x, y, color)
	self.super.__init(self, x, y)

	-- Validate the color array
	assertIs("table", color)
	assertEq(3, #color)
	assertIs("number", color[1])
	assertIs("number", color[2])
	assertIs("number", color[3])
	self.color = color

	self.originX = 25
	self.originY = 25
	self.size = 50
end

function Square:draw()
	love.graphics.setColor(unpack(self.color))
	local drawX, drawY = self:getScreenPosition(state.cameraX,
		state.cameraY)

	love.graphics.rectangle("fill", drawX, drawY, self.size, self.size)
end

function Square:takeDamage(dealer, amount)
	assertIs("number", amount)
	state:remove(self)
end

