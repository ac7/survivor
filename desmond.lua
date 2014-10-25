
Desmond = Entity:extends{
	originX = 25,
	originY = 25,
	speed = 512,
	swing = 0,

	swingDuration = 0.2,
	swingRadius = 128,
	swingDamage = 25,
}

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
	self.swing = self.swing - dt
	self.super.update(self, dt)
end

function Desmond:draw()
	love.graphics.setColor(255, 255, 255)

	local drawX, drawY = self:getScreenPosition(
		state.cameraX, state.cameraY)

	if self.swing > 0 then
		local proportion = self.swing / self.swingDuration

		-- draw a partially transparent filled circle in the swing
		-- radius
		love.graphics.setColor(255, 0, 255, 255 * (1-proportion))
		love.graphics.circle("fill", drawX+self.originX,
			drawY+self.originY, self.swingRadius * proportion)

		-- draw a white border around the edge of the circle
		love.graphics.setColor(255, 255, 255)
		love.graphics.circle("line", drawX+self.originX,
			drawY+self.originY, self.swingRadius * proportion)
	end

	-- draw a line from `self` to the mouse cursor
	love.graphics.setColor(255, 255, 255)
	local mouseX, mouseY = love.mouse.getPosition()
	love.graphics.line(drawX+self.originX, drawY+self.originY,
		mouseX, mouseY)

	-- draw a black square with a white border to represent self
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle("fill", drawX, drawY, 50, 50)
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("line", drawX, drawY, 50, 50)
end

function Desmond:keypressed(key, unicode) end
function Desmond:keyreleased(key, unicode) end

function Desmond:mousepressed(mx, my, button)
	if button ~= "l" then return; end

	-- if we are currently swinging, duck out
	if self.swing > 0 then return; end

	-- begin a new swing
	self.swing = self.swingDuration

	-- loop through entities and deal damage to those that are affected
	for _, entity in pairs(state.entities) do
		if entity.takeDamage and distance(self.x, self.y,
			entity.x, entity.y) < self.swingRadius then

			entity:takeDamage(self, self.swingDamage)
		end
	end
end

