
function love.load()
	require "imports"

	local play = Play:new()
	desmond = Desmond:new({})
	table.insert(play.entities, desmond)
	setState(play)
end

function love.update(dt)
	for _, v in pairs(state.entities) do
		v:update(dt)
	end
end

function love.draw()
	for _, v in pairs(state.entities) do
		v:draw()
	end
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

