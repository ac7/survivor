
Desmond = Entity:extends{}

function Desmond:draw()
	love.graphics.setColor(255, 255, 255)
	local drawX, drawY = self:getScreenPosition()
	love.graphics.rectangle("fill", drawX, drawY, 50, 50)
end

function Desmond:update(dt)
	local movX, movY = 0, 0

	if love.keyboard.isDown("w") then movY = -1; end
	if love.keyboard.isDown("a") then movX = -1; end
	if love.keyboard.isDown("s") then movY = 1; end
	if love.keyboard.isDown("d") then movX = 1; end

	if movX ~= 0 or movY ~= 0 then
		self.speed = 200
	else self.speed = 0; end

	self.angle = math.atan2(movX, movY)

	self.super.update(self, dt)
end

function Desmond:keypressed(key, unicode) end
function Desmond:keyreleased(key, unicode) end

