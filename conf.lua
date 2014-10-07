
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

	-- Testing can be overridden by passing a "--test" parameter to the
	-- executable. If this parameter is present, we run the tests and
	-- immediately exit.
	for _, a in pairs(arg) do
		if a == "--test" then
			enableTesting = true
			require "imports"
			os.exit(0)
		end
	end
end

