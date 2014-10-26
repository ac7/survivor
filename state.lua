
State = class{
	-- `entities` cannot be initialized to a table because otherwise the
	-- same table would be shared by all descendents of `State`. Thanks Lua.
	entities = nil,
}

function State:setup() end

State.draw = callMethod("draw", "entities")
State.update = callMethod("update", "entities")

function State:remove(entity)
	assertIs("table", entity)
	for i, v in pairs(self.entities) do
		if v == entity then
			self.entities[i] = nil
			return
		end
	end
	error("Entity " .. entity ..
		" was not found in state but it was passed to state:remove()")
end

function setState(newState)
	-- don't set state to newState until `setup()` has been called in case
	-- newState needs to reference the current state for some reason
	newState:setup()
	state = newState
end

