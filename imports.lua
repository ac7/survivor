
--[[

This is the imports module where we require everything. Since there's no
automatic `require` validator for Lua, and the require statements would be
likely to get out of sync with the actual source code, the source files in this
program do not have any `require` statements. Instead, they depend on the fact
that this file imports everything for them and that the `main.lua` file will
have already imported this file.

--]]

-- In this program, we treat 30log like it was built into Lua and `class` is a
-- keyword. All the modules in the program assume they can use `class`.
class = require "30log"

-- Yeah, we're polluting the _G namespace like you've never seen before. Make
-- sure these `require`s are listed in the order that they depend on each other.
require "util"
require "image_manager"
require "state"
require "play"
require "entity"
require "comrade"
require "square"
require "desmond"

if enableTesting then
	require "entity_test"
	require "comrade_test"
	require "desmond_test"
	require "play_test"
	require "state_test"
	require "test"
	runTests()
end

