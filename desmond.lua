
Desmond = Entity:extends{}
desmondSpeed = 200

-- The isDown parameter defaults to love.keyboard.isDown but it can be swapped
-- out for unit tests.
function Desmond:update(dt, isDown)
	local movX, movY = 0, 0
	local isDown = isDown or love.keyboard.isDown

	if isDown("w") then movY = -1; end
	if isDown("a") then movX = -1; end
	if isDown("s") then movY = 1; end
	if isDown("d") then movX = 1; end

	if movX ~= 0 or movY ~= 0 then
		self.speed = desmondSpeed
	else self.speed = 0; end

	self.originX = 25
	self.originY = 25

	self.angle = math.atan2(movX, movY)
	self.super.update(self, dt)
end

function Desmond:draw()
	love.graphics.setColor(255, 255, 255)
	local drawX, drawY = self:getScreenPosition()
	love.graphics.rectangle("fill", drawX, drawY, 50, 50)
	local mouseX, mouseY = love.mouse.getPosition()
	love.graphics.line(self.x, self.y, mouseX, mouseY)
end

function Desmond:keypressed(key, unicode) end
function Desmond:keyreleased(key, unicode) end

