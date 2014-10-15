
function love.load()
	require "imports"

	local play = Play:new()
	desmond = Desmond:new({})
	table.insert(play.entities, desmond)
	setState(play)
end

function love.update(dt)
	state:update(dt)
end

function love.draw()
	state:draw(dt)
end

function love.keypressed(key, unicode)
	desmond:keypressed(key, unicode)
end

function love.keyreleased(key, unicode)
	if key == "return" then
		-- toggle fullscreen
		love.window.setFullscreen(not love.window.getFullscreen())
	elseif key == "escape" then
		love.event.push("quit")
	end
	desmond:keyreleased(key, unicode)
end

