
State = class{
	-- `entities` cannot be initialized to a table because otherwise the
	-- same table would be shared by all descendents of `State`. Thanks Lua.
	entities = nil,
}

function State:setup() end

function State:update(dt)
	assertIs("table", self.entities)
	for _, v in pairs(self.entities) do
		v:update(dt)
	end
end

function setState(newState)
	-- don't set state to newState until `setup()` has been called in case
	-- newState needs to reference the current state for some reason
	newState:setup()
	state = newState
end

