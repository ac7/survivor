
play = {
	entities = {},
	cameraX = 0,
	cameraY = 0,
}

function play:setup()
	love.graphics.setBackgroundColor(50, 0, 0)
end

function testPlay()
	assert(play)
	assert(type(play.entities) == "table")
	assert(play.setup)
end

