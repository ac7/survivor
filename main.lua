
function love.load()
	require "imports"

	local play = Play:new()
	desmond = Desmond:new()
	table.insert(play.entities, desmond)
	table.insert(play.entities, Square(128, 0, {255, 0, 0}))
	table.insert(play.entities, Square(-256, 0, {255, 0, 0}))
	table.insert(play.entities, Square(-96, 128, {255, 0, 0}))
	table.insert(play.entities, Square(96, 128, {255, 0, 0}))
	play:track(desmond)
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
	if key == "escape" then
		love.event.push("quit")
	end
	desmond:keyreleased(key, unicode)
end

function love.mousepressed(mx, my, button)
	desmond:mousepressed(mx, my, button)
end

