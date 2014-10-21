
Desmond = Entity:extends{
	originX = 25,
	originY = 25,
	speed = 512,
	swing = 0,
}
local swingDuration = 0.3
local swingRadius = 80
local swingDamage = 25

function Desmond:__init(x, y)
	self.super.__init(self, x, y)
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
	self.swing = self.swing - dt
	self.super.update(self, dt)
end

function Desmond:draw()
	love.graphics.setColor(255, 255, 255)

	local drawX, drawY = self:getScreenPosition(
		state.cameraX, state.cameraY)

	if self.swing > 0 then
		local proportion = self.swing / swingDuration
		love.graphics.setColor(255, 0, 0, 255 * (1-proportion))
		love.graphics.circle("fill", drawX+self.originX,
			drawY+self.originY, swingRadius * proportion)
	end

	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("fill", drawX, drawY, 50, 50)

	local mouseX, mouseY = love.mouse.getPosition()
	love.graphics.line(drawX+self.originX, drawY+self.originY,
		mouseX, mouseY)
end

function Desmond:keypressed(key, unicode) end
function Desmond:keyreleased(key, unicode) end

function Desmond:mousepressed(mx, my, button)
	if button == "l" then
		if self.swing > 0 then
			return
		end

		self.swing = swingDuration

		for _, entity in pairs(state.entities) do
			if distance(self.x, self.y,
				entity.x, entity.y) < swingRadius then

				if entity.takeDamage then
					entity:takeDamage(self, swingDamage)
				end
			end
		end
	end
end

