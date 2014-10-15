
Desmond = Entity:extends{
	originX = 25,
	originY = 25,
	speed = 512,
}

function Desmond:__init(container, img, x, y)
	self.super.__init(self, container, img, x, y)
end

-- The isDown parameter defaults to love.keyboard.isDown but it can be swapped
-- out for unit tests.
function Desmond:update(dt, isDown)
	local movX, movY = 0, 0
	local isDown = isDown or love.keyboard.isDown

	if isDown("w") then movY = -1; end
	if isDown("a") then movX = -1; end
	if isDown("s") then movY = 1; end
	if isDown("d") then movX = 1; end

	self.moving = movX ~= 0 or movY ~= 0
	self.angle = math.atan2(movX, movY)
	self.super.update(self, dt)
end

function Desmond:draw()
	love.graphics.setColor(255, 255, 255)

	local drawX, drawY = self:getScreenPosition(
		state.cameraX, state.cameraY)
	love.graphics.rectangle("fill", drawX, drawY, 50, 50)

	local mouseX, mouseY = love.mouse.getPosition()
	love.graphics.line(drawX+self.originX, drawY+self.originY,
		mouseX, mouseY)
end

function Desmond:keypressed(key, unicode) end
function Desmond:keyreleased(key, unicode) end

