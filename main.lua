
class = require "30log"
require "play"
require "test"

function love.load()
	if enableTesting then runTests(); end

	state = play
end

function love.draw()
	assert(state)
	for _, v in pairs(state.entities) do
		assert(v)
		v:draw()
	end
end

