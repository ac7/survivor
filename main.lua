
class = require "30log"

require "entity"
require "image_manager"
require "play"
require "test"

function love.load()
	if enableTesting then runTests(); end

	state = play
end

function love.update(dt)
	assert(state)
	for _, v in pairs(state.entities) do
		v:update(dt)
	end
end

function love.draw()
	assert(state)
	for _, v in pairs(state.entities) do
		v:draw()
	end
end

