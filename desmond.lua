
Desmond = Entity:extends{}

function Desmond:draw()
	love.graphics.setColor(255, 255, 255)
	local drawX, drawY = self:getScreenPosition()
	love.graphics.rectangle("fill", drawX, drawY, 50, 50)
end

function Desmond:keypressed(key, unicode)
end

function Desmond:keyreleased(key, unicode)
end

