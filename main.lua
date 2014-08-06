
local desmond

function love.load()
	require "imports"

	desmond = Desmond:new({}, 0, 0)
	state = play
end

function love.update(dt)
	assert(state)
	for _, v in pairs(state.entities) do
		-- pointless to `assert` that v has an `update` method because
		-- the interpreter will crash anyway when we call it
		v:update(dt)
	end
end

function love.draw()
	assert(state)
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
	end
	desmond:keyreleased(key, unicode)
end

