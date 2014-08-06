
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

-- yeah, we're polluting the _G namespace like you've never seen before.
require "image_manager"
require "play"

-- we have to make sure to import subclasses after the original class
require "entity"
require "desmond"

require "test"

