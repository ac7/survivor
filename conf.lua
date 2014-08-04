
function love.conf(t)
	t.version = "0.9.1"

	t.window.title = "survivor"
	t.window.width = 960
	t.window.height = 540
	t.window.fullscreentype = "desktop"

	t.modules.physics = false
	t.modules.joystick = false

	-- Enable/disable custom test system
	-- If enabled, run unit tests before every launch of the game
	enableTesting = true
end

